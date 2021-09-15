import QtQuick 2.0
import "Blocks.mjs" as Blocks
import "Timer.mjs" as Timer

Item {
    visible: false
    focus: true

    required property int interval
    required property var board

    property int row: 0
    property int col: 0
    property var items
    property var block

    signal setted

    Component.onCompleted: {
        reset()

        // event
        board.focus = true
        board.Keys.onUpPressed.connect(rotate)
        board.Keys.onLeftPressed.connect(move(({ col }) => ({ col: col - 1 })))
        board.Keys.onRightPressed.connect(move(({ col }) => ({ col: col + 1 })))

        // frame
        let counter = 0
        let threshold = interval
        board.Keys.onDownPressed.connect(() => { threshold = interval / 3 })
        board.Keys.onReleased.connect((event) => { if (event.key === Qt.Key_Down) threshold = interval })

        function frame() {
            if (counter < threshold) {
                counter++
                return
            }

            counter = 0
            const tryMoveDown = move(({ row }) => ({ row: row + 1 }))()
            if(!tryMoveDown) {
                setted()
                reset()
            }
        }

        Timer.setInterval(frame, 1)
    }

    function reset() {
        row = -1
        col = board.countRow / 2 - 1
        block = Blocks.random()
        items = getItems({ row, col })
    }

    function move(next) {
        return () => {
            const now = { row, col }
            const step = Object.assign({}, now, next({ row, col }))
            const newItems = getItems(step)

            if (!newItems.every(isValidArea)) {
                return false
            }

            items.forEach(a => board.unactive(a.row, a.col))
            newItems.forEach(a => board.active(a.row, a.col))

            row = step.row
            col = step.col
            items = newItems

            return true
        }
    }

    function rotate() {
        const nextState = (block.state + 1) % block.states.length
        const newItems = getItems({ row, col }, block.states[nextState])

        if (!newItems.every(isValidArea)) {
            return false
        }

        items.forEach(a => board.unactive(a.row, a.col))
        newItems.forEach(a => board.active(a.row, a.col))

        block.state = nextState
        items = newItems

        return true
    }

    function isValidArea(next) {
        return items.find(a => a.row === next.row && a.col === next.col)
            || (next.col >= 0
                && next.col < board.countCol
                && next.row < board.countRow
                && !board.isActive(next.row, next.col)
            )
    }

    function getItems(origin, state) {
        state = state || block.states[block.state]
        return state.map(a => ({
            row: origin.row - a.row,
            col: origin.col + a.col,
        }))
    }
}
