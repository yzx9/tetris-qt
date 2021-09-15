import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: app
    width: tetris.width
    height: tetris.height
    visible: true
    title: qsTr("My First Qt Project -- Celeste")

    Tetris {
        id: tetris
    }
}
