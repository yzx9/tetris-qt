import QtQuick 2.0

Rectangle {
    id: scoreboard
    color: "#eeeeee"
    height: 30

    required property int score

    Text {
        text: scoreboard.score
        font.pointSize: 18

        anchors.left: scoreboard.left
        anchors.leftMargin: 10
        anchors.rightMargin: 10
    }
}
