import QtQuick 2.0

Rectangle {
    id: board
    color: "#eeeeee"

    property var rows: []
    required property int countRow
    required property int countCol
    required property int cellWidth
    required property int cellSpan

    width: (cellWidth + cellSpan) * countCol + cellSpan
    height: (cellWidth + cellSpan) * countRow + cellSpan

    function isActive(row, col) {
        if (row < 0 || row >= countRow || col < 0 || col >= countCol) {
            return false
        }

        return rows[row][col].active
    }

    function setActive(row, col, active) {
        if (row < 0 || row >= countRow || col < 0 || col >= countCol) {
            return false
        }

        rows[row][col].active = active
        return true
    }

    function active(row, col) { return setActive(row, col, true) }
    function unactive(row, col) { return setActive(row, col, false) }

    Component.onCompleted: {
        for (let i = 0; i < countRow; i++) {
            const row = []
            rows.push(row)

            for (let j = 0; j < countCol; j++) {
                const cell = Qt
                    .createComponent("./Cell.qml")
                    .createObject(board, {
                        y: (cellWidth + cellSpan) * i + cellSpan,
                        x: (cellWidth + cellSpan) * j + cellSpan,
                        width: cellWidth
                    })

                row.push(cell)
            }
        }
    }
}
