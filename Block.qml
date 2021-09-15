import QtQuick 2.0
import "Timer.mjs" as Timer

Item {
    id: block
    visible: false
    focus: true

    required property int interval
    required property var board

    property int row: -1
    property int col: board.countRow / 2

    signal setted

    Component.onCompleted: {
        Timer.setInterval(() => {
            const tryMoveDown = move(({ row }) => ({ row: row + 1 }))()
            if(!tryMoveDown) {
                setted()
                reset()
            }
        }, interval)

        board.focus = true
        board.Keys.onLeftPressed.connect(move(({ col }) => ({ col: col - 1 })))
        board.Keys.onRightPressed.connect(move(({ col }) => ({ col: col + 1 })))
    }

    function reset() {
        row = -1
        col = board.countRow / 2
    }

    function move(next) {
        return () => {
            const now = { row, col }
            const step = Object.assign({}, now, next({ row, col }))

            if (!isValidArea(step)) {
                return false
            }

            board.unactive(row, col)
            board.active(step.row, step.col)

            row = step.row
            col = step.col

            return true
        }
    }

    function isValidArea(step) {
        return step.col >= 0
            && step.col < board.countCol
            && step.row < board.countRow
                && !board.isActive(step.row, step.col)
    }
}
