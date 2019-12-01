import QtQuick 2.12

Rectangle {
    id: pagesettings
    width: 596
    height: 446
    color: "#000000"

    Text {
        id: lblSettingsAppearance
        x: 21
        y: 21
        color: "#ffffff"
        text: qsTr("Appearance settings")
        font.bold: true
        font.pixelSize: 18

        Text {
            id: lblSettingsCSD
            x: 0
            y: 28
            color: "#ffffff"
            text: qsTr("Use native window decorations")
            font.bold: false
            font.pixelSize: 16

            SliderButton {
                id: sliderSettingsCSD
                x: 510
                y: 0
                state: settings.usecsd ? '' : 'on'
                onClicked: {
                    if(sliderSettingsCSD.state === 'on') {
                        settings.usecsd = false
                        mainWindow.flags = Qt.Window

                        menuBar.visible = false

                        navigatorBar.anchors.topMargin = 0
                        navigatorBar.anchors.leftMargin = 0
                        navigatorBar.anchors.bottomMargin = 0
                        navigatorBar.width = 202
                        navigatorBar.height = 448

                        page.anchors.topMargin = 0
                        page.anchors.rightMargin = 0
                        page.anchors.bottomMargin = 0
                        page.width = 598
                        page.height = 448

                        windowFrame.border.width = 0
                    } else {
                        settings.usecsd = true
                        mainWindow.flags = Qt.Window | Qt.FramelessWindowHint

                        menuBar.visible = true

                        navigatorBar.anchors.topMargin = 32
                        navigatorBar.anchors.leftMargin = 2
                        navigatorBar.anchors.bottomMargin = 2
                        navigatorBar.width = 200
                        navigatorBar.height = 446

                        page.anchors.topMargin = 32
                        page.anchors.rightMargin = 2
                        page.anchors.bottomMargin = 2
                        page.width = 596
                        page.height = 446

                        windowFrame.border.width = 2
                    }
                }
            }
        }
    }
}
