import QtQuick 2.0

Rectangle {
    default property bool active: false
    height: width
    color: active ? "#D32F2F" : "#FFCDD2"
}
