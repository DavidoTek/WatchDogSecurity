import QtQuick 2.12

Rectangle {
    id: sliderButton
    width: 44
    height: 19
    color: "#3a3a3a"
    radius: 8

    signal clicked

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        hoverEnabled: true

        onClicked: {
            sliderButton.state == 'on' ? sliderButton.state = '' : sliderButton.state = 'on'
            sliderButton.clicked()
        }

        onEntered: sliderButton.state == '' ? sliderButton1.x = 8 : sliderButton1.x = 25
        onExited: sliderButton.state == '' ? sliderButton1.x = 6 : sliderButton1.x = 27

    }

    Rectangle {
        id: sliderButton1
        x: 6
        y: 4
        width: 11
        height: 11
        color: "#ffffff"
        radius: 8
    }

    states: [
        State {
            name: "on"
            PropertyChanges {
                target: sliderButton1
                x: 27
                color: "#ffffff"
            }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "on"
            reversible: true
            SequentialAnimation {
                PropertyAnimation { property: "x"; duration: 50 }
                ColorAnimation { duration: 50 }
            }
        }
    ]
}
