import QtQuick 2.12

Rectangle {
    id: pagesettings
    width: 596
    height: 446
    color: "#000000"

    Text {
        id: element
        x: 8
        y: 8
        color: "#ffffff"
        text: qsTr("Scanner")
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: lblScannedElements
        x: 8
        y: 36
        width: 115
        height: 14
        color: "#ffffff"
        text: qsTr("SCANNED ELEMENTS")
        font.bold: true
        font.pixelSize: 12

        Text {
            id: txtScannedElements
            x: 428
            y: 0
            width: 152
            height: 14
            color: "#ffffff"
            text: qsTr("00000000")
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }
    }

    Text {
        id: lblInfectedElements
        x: 8
        y: 56
        width: 115
        height: 14
        color: "#ffffff"
        text: qsTr("INFECTED ELEMENTS")
        Text {
            id: txtInfectedElements
            x: 428
            y: 0
            width: 152
            height: 14
            color: "#ffffff"
            text: qsTr("00000000")
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }
        font.pixelSize: 12
    }

    Text {
        id: lblErrors
        x: 8
        y: 96
        width: 115
        height: 14
        color: "#ffffff"
        text: qsTr("ERRORS / ELEMENTS FAILED TO SCAN")
        Text {
            id: txtErrors
            x: 428
            y: 0
            width: 152
            height: 14
            color: "#ffffff"
            text: qsTr("00000000")
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }
        font.pixelSize: 12
    }

    Text {
        id: lblErrors1
        x: 28
        y: 76
        width: 115
        height: 14
        color: "#ffffff"
        text: qsTr("ERRORS / ELEMENTS FAILED TO SCAN")
        Text {
            id: txtErrors1
            x: 408
            y: 0
            width: 152
            height: 14
            color: "#ffffff"
            text: qsTr("00000000")
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }
        font.pixelSize: 12
    }

    Text {
        id: lblSkippedFiles
        x: 8
        y: 116
        width: 115
        height: 14
        color: "#ffffff"
        text: qsTr("SKIPPED FILES")
        Text {
            id: txtSkippedFiles
            x: 428
            y: 0
            width: 152
            height: 14
            color: "#ffffff"
            text: qsTr("00000000")
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }
        font.pixelSize: 12
    }

    Button {
        id: btnCancelScan
        x: 468
        y: 398
        buttonText: "CANCEL"
    }



}
