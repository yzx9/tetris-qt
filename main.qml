import QtQuick 2.15
import QtQuick.Window 2.15
import "Timer.mjs" as Timer
import "Tetris.mjs" as Tetris

Window {
    id: app
    width: board.width
    height: board.height
    visible: true
    title: qsTr("My First Qt Project -- Celeste")

    Board {
        id: board
        x: 0
        y: 0

        countRow: 5
        countCol: 3

        cellWidth: 40
        cellSpan: 5

        Component.onCompleted: {
            Timer.setTimeout(() => Tetris.run(board), 2000)
        }
    }
}
