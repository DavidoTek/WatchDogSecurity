import QtQuick 2.12
import QtQuick.Dialogs 1.2

Rectangle {
    id: pageav
    width: 596
    height: 446
    color: "#000000"

    // SCHEDULER SCANS
    Text {
        id: lblScheduler
        x: 21
        y: 295
        color: "#ffffff"
        text: qsTr("Scheduler")
        font.bold: true
        font.pixelSize: 16

        SliderButton {
            id: sliderScheduler
            x: 510
            y: 1
            width: 44
            height: 18
            onClicked: {
                if (state === 'on') {
                    av.startScheduler(true)
                } else {
                    av.startScheduler(false)
                }
            }
            enabled: false
        }
    }

    // CUSTOM SCANS
    Text {
        id: element
        x: 21
        y: 21
        color: "#ffffff"
        text: qsTr("Custom scans")
        font.bold: true
        font.pixelSize: 16
    }

    Grid {
        id: grid
        y: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 180
        anchors.right: parent.right
        anchors.rightMargin: 21
        anchors.left: parent.left
        anchors.leftMargin: 21
        anchors.top: parent.top
        anchors.topMargin: 46
        spacing: 1
        rows: 2
        columns: 3

        ButtonX {
            id: btnScanSimple
            width: 184
            height: 120
            buttonText: qsTr("Simple Scan")
            onClicked: {
                av.scanFixed(0)
            }
        }

        ButtonX {
            id: btnScanComplete
            width: 184
            height: 120
            buttonText: qsTr("Complete Scan")
            onClicked: {
                av.scanFixed(1)
            }
        }

        ButtonX {
            id: btnScanRootkit
            width: 184
            height: 120
            buttonText: qsTr("Rootkit Scan")
            enabled: false
        }

        ButtonX {
            id: btnScanFile
            width: 184
            height: 120
            buttonText: qsTr("Scan File")
            onClicked: {
                scanFDialog.title = qsTr("Select file(s) to scan")
                scanFDialog.selectFolder = false
                scanFDialog.selectMultiple = true
                scanFDialog.scanType = 0
                scanFDialog.open()
            }
        }

        ButtonX {
            id: btnScanFolder
            width: 184
            height: 120
            buttonText: qsTr("Scan Folder")

            onClicked: {
                scanFDialog.title = qsTr("Select a folder to scan")
                scanFDialog.selectMultiple = false
                scanFDialog.selectFolder = true
                scanFDialog.scanType = 1
                scanFDialog.open()
            }
        }

        ButtonX {
            id: btnScanDrive
            width: 184
            height: 120
            buttonText: qsTr("Scan Drive")
            enabled: false
        }
    }





}



/*##^##
Designer {
    D{i:1;anchors_y:406}
}
##^##*/
