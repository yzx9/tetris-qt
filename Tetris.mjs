import { setInterval } from "./Timer.mjs"

export function run(board) {
    const block = Qt.createComponent("qrc:/Block.qml").createObject(Qt.application, { interval: 500, board })

    block.onSetted.connect(() => {
        const rows = checkRows(board)
        if (rows.length) {
            moveDownRows(board, rows)
        }
    })
}

function checkRows(board) {
    const rows = []

    for (let row = 0; row < board.countRow; row++) {
        if (board.rows[row].every((_, col) => board.isActive(row, col))) {
            rows.push(row)
        }
    }

    return rows
}

function moveDownRows(board, rows) {
    let row = board.countRow - 1
    let last = row

    for (; row >= rows.length; row--) {
        if (rows.includes(row)) {
            continue
        }

        if (row != last) {
            for (let col = 0; col < board.countCol; col++) {
                board.setActive(last, col, board.isActive(row, col))
            }
        }

        last--
    }

    for (; row >= 0; row--) {
        for (let col = 0; col < board.countCol; col++) {
            board.unactive(row, col)
        }
    }
}
