import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: app
    width: 640
    height: 800
    visible: true
    title: qsTr("My First Qt Project -- Celeste")

    Board {
        x: 0;
        y: 0;
        width: 640;
        height: 640;
    }
}
