import QtQuick 2.0
import "Timer.mjs" as Timer

Item {
    id: tetris
    width: board.width
    height: scoreboard.height + board.height

    property int score: 0

    Scoreboard {
        id: scoreboard
        x: 0
        y: 0
        width: board.width
        score: tetris.score
    }

    Board {
        id: board
        x: 0
        y: scoreboard.height

        countRow: 22
        countCol: 15

        cellWidth: 20
        cellSpan: 5
    }

    Component.onCompleted: {
        Qt.createComponent("qrc:/Block.qml")
            .createObject(Qt.application, { interval: 300, board })
            .onSetted
            .connect(() => {
                const rows = checkRows(board)
                if (rows.length) {
                    score += rows.length
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
}
