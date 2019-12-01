import QtQuick 2.0

Rectangle {
    id: buttonx

    property string buttonText
    property int buttonTextSize: 14
    property string buttonColor: "#3A3A3A"
    property string enterColor: "#aaaaaa"
    property string pressColor: "#bbbbbb"
    signal clicked

    width: 120
    height: 40
    color: buttonColor

    Text {
        text: buttonText
        font.pixelSize: buttonx.buttonTextSize
        font.bold: true
        color: "white"
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent

        hoverEnabled: true
        onEntered: parent.color = buttonx.enterColor
        onPressed: parent.color = buttonx.pressColor
        onExited: parent.color = buttonx.buttonColor

        onClicked: {
            buttonx.clicked()
        }
    }
}
