import QtQuick 2.0

Rectangle {
    id: board
    color: "#eeeeee"

    property var rows: []

    function isActive(row, col) {
        return rows[row][col].active
    }

    function active(row, col) {
        rows[row][col].active = true
    }

    function unactive(row, col) {
        rows[row][col].active = false
    }

    Component.onCompleted: {
        for (let i = 0; i < 10; i++) {
            const row = []
            rows.push(row)

            for (let j = 0; j < 10; j++) {
                const cell = Qt
                    .createComponent("Cell.qml")
                    .createObject(board, {
                        x: 50 * i + 5,
                        y: 50 * j + 5,
                        width: 40,
                        height: 40
                    })

                row.push(cell)
            }
        }
    }
}
