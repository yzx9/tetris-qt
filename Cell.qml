import QtQuick 2.0

Rectangle {
    default property bool active: false

    width: 100
    height: 100
    color: active ? "#D32F2F" : "#FFCDD2"
}
