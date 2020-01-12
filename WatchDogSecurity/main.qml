import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import Qt.labs.settings 1.0
import wds.antivirus 1.0

Window {
    id: mainWindow

    MessageDialog {
        id: msgBox
    }

    Settings {
        id: settings
        property bool usecsd: true
        property date lastscan
        property int pcstatus: 0
    }

    visible: true
    width: 800
    height: 480
    title: qsTr("WatchDogSecurity - Security Center")
    flags: settings.usecsd ? Qt.Window | Qt.FramelessWindowHint : Qt.Window

    property int posX: 0
    property int posY: 0

    property date currentDate: new Date()

    Antivirus {
        id: av
    }

    FileDialog {
        id: scanFDialog
        property int scanType: 0
        onAccepted: {
            switch(scanType) {
            case 0: // 0: Scan file(s)
                if (!av.scanFiles(scanFDialog.fileUrls)) {
                    msgBox.title = qsTr("Please update!")
                    msgBox.text = qsTr("Please update the ClamAV database!")
                    msgBox.visible = true
                }
                break;
            case 1: // 1: Scan folder
                if (!av.scanFiles(scanFDialog.fileUrl)) {
                    msgBox.title = qsTr("Please update!")
                    msgBox.text = qsTr("Please update the ClamAV database!")
                    msgBox.visible = true
                }
                break;
            }
            settings.lastscan = currentDate
        }
    }

    Rectangle {
        id: windowFrame
        height: parent.height
        width: parent.width

        border.color: "gray"
        border.width: 2

        // Menu Bar
        Rectangle {
            id: menuBar
            height: 32
            width: parent.width
            color: "#222222"

            // Rightclick context menu
            Menu {
                id: cmenu
                MenuItem {
                    text: "About"
                    onTriggered: pageLoader.source = "PageAbout.qml"
                }
                MenuSeparator {}
                MenuItem {
                    text: "Minimize"
                    onTriggered: mainWindow.showMinimized()
                }
                MenuItem {
                    text: "E&xit"
                    onTriggered: Qt.quit()
                }
            }

            MouseArea {
                id: menuBarMouseArea
                anchors.fill: parent

                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onPressed: {
                    posX = mouseX
                    posY = mouseY

                    if (menuBarMouseArea.pressedButtons & Qt.RightButton) {
                        cmenu.popup()
                    }
                }

                onMouseXChanged:
                {
                    mainWindow.setX(mainWindow.x + (mouseX - posX))
                }

                onMouseYChanged:
                {
                    mainWindow.setY(mainWindow.y + (mouseY - posY))
                }
            }

            Row {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                layoutDirection: Qt.RightToLeft

                // Close Button [X]
                ButtonX {
                    id: btnCtrlClose
                    height: 32
                    width: 48
                    buttonText: "X"
                    buttonColor: "#252525"
                    pressColor: "#ff0000"
                    enterColor: "#dd0000"
                    onClicked: Qt.quit()
                }

                // Minimize Button [_]
                ButtonX {
                    id: btnCtrlMinimize
                    height: 32
                    width: 48
                    buttonText: "_"
                    buttonColor: "#252525"
                    pressColor: "#999999"
                    enterColor: "#888888"
                    onClicked: mainWindow.showMinimized()
                }

                // Window Title
            }

            Text {
                id: txtWinTitle
                text: mainWindow.title
                color: "white"
                anchors.fill: parent
                anchors.rightMargin: 390
                anchors.leftMargin: 390
                anchors.bottomMargin: 10
                anchors.topMargin: 10

                transformOrigin: Item.Center
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Image {
                id: name
                source: "favicon.ico"
                height: 32
                width: 32
            }
        } // END Menu Bar

        // Navigator Bar
        Rectangle {
            id: navigatorBar
            color: "#333333"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: settings.usecsd ? 2 : 0
            anchors.top: parent.top
            anchors.topMargin: settings.usecsd ? 32 : 0
            anchors.left: parent.left
            anchors.leftMargin: settings.usecsd ? 2 : 0
            width: settings.usecsd ? 200 : 202
            height: settings.usecsd ? 446 : 448

            // Top Elements (HOME, AV, FW)
            Column {
                spacing: 1
                // HOME Button
                ButtonX {
                    id: btnPageHome
                    height: 40
                    width: 200
                    buttonText: "Home"
                    buttonTextSize: 20
                    buttonColor: "#3A3A3A"
                    pressColor: "#bbbbbb"
                    enterColor: "#aaaaaa"
                    onClicked: {
                        pageLoader.source = "PageHome.qml"
                    }
                }

                // PageAV Button
                ButtonX {
                    id: btnPageAV
                    height: 40
                    width: 200
                    buttonText: "Antivirus"
                    buttonTextSize: 20
                    buttonColor: "#3A3A3A"
                    pressColor: "#bbbbbb"
                    enterColor: "#aaaaaa"
                    onClicked: {
                        pageLoader.source = "PageAV.qml"
                    }
                }

                // PageFW Button
                ButtonX {
                    id: btnPageFW
                    height: 40
                    width: 200
                    buttonText: "Firewall"
                    buttonTextSize: 20
                    buttonColor: "#3A3A3A"
                    pressColor: "#bbbbbb"
                    enterColor: "#aaaaaa"
                    onClicked: {
                        pageLoader.source = "PageFW.qml"
                    }
                }

            }

            // Bottom Elements (Update, Settings)
            Column {
                x: 0
                y: 349
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                spacing: 1
                // PageUpdate Button
                ButtonX {
                    id: btnPageUpdate
                    height: 40
                    width: 200
                    buttonText: "Update"
                    buttonTextSize: 20
                    buttonColor: "#3A3A3A"
                    pressColor: "#bbbbbb"
                    enterColor: "#aaaaaa"
                    onClicked: {
                        pageLoader.source = "PageUpdate.qml"
                    }
                }

                // PageSettings Button
                ButtonX {
                    id: btnPageSettings
                    height: 40
                    width: 200
                    buttonText: "Settings"
                    buttonTextSize: 20
                    buttonColor: "#3A3A3A"
                    pressColor: "#bbbbbb"
                    enterColor: "#aaaaaa"
                    onClicked: {
                        pageLoader.source = "PageSettings.qml"
                    }
                }
            }
        } // END Navigator Bar

        // Page
        Rectangle {
            id: page
            color: "black"
            anchors.top: parent.top
            anchors.topMargin: settings.usecsd ? 32 : 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: settings.usecsd ? 2 : 0
            anchors.left: parent.left
            anchors.leftMargin: settings.usecsd ? 202 : 200
            anchors.right: parent.right
            anchors.rightMargin: settings.usecsd ? 2 : 0
            width: settings.usecsd ? 598 : 596
            height: settings.usecsd ? 448 : 446
            Loader {
                id: pageLoader
            }

            Component.onCompleted: {
                pageLoader.source = "PageHome.qml"
                mainWindow.raise()
            }
        } // END Page

    }
}


/*##^##
Designer {
    D{i:12;anchors_height:448;anchors_x:0;anchors_y:32}D{i:11;anchors_x:390;anchors_y:11}
D{i:20;anchors_height:440;anchors_width:592;anchors_x:206;anchors_y:38}D{i:23;anchors_y:349}
}
##^##*/
