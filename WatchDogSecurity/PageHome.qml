import QtQuick 2.12

Rectangle {
    id: pagehome
    width: 596
    height: 446
    color: "#000000"
    Image {
        id: imgStatus
        width: 160
        height: 160
        anchors.left: parent.left
        anchors.leftMargin: 80
        anchors.top: parent.top
        anchors.topMargin: 60
        fillMode: Image.PreserveAspectFit
        source: "res/pcOK.png"
    }

    Text {
        id: txtStatusPC
        color: "#ffffff"
        text: qsTr("Your PC is safe.")
        anchors.left: parent.left
        anchors.leftMargin: 260
        anchors.top: parent.top
        anchors.topMargin: 80
        font.bold: true
        font.pixelSize: 20
    }

    Text {
        id: txtStatusUpdate
        x: 6
        y: 7
        width: 80
        height: 14
        color: "#ffffff"
        text: qsTr("Update available!")
        font.pixelSize: 12
        anchors.leftMargin: 260
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 130
    }

    Text {
        id: txtStatusLastScan
        width: 80
        height: 14
        color: "#ffffff"
        text: qsTr("Last scanned on " + settings.lastscan)
        anchors.top: parent.top
        anchors.topMargin: 110
        anchors.left: parent.left
        anchors.leftMargin: 260
        font.pixelSize: 12
    }

    Text {
        id: txtStatusFixMessage
        x: 520
        y: 286
        width: 80
        height: 14
        color: "#ffffff"
        text: qsTr("Nothing to do!")
        anchors.leftMargin: 260
        font.pixelSize: 12
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 149
    }

    function changeStatus(statusImage, statusPC, statusUpdate, statusScan, statusFix) {
        imgStatus.source = statusImage
        txtStatusPC.text = statusPC
        txtStatusUpdate.text = statusUpdate
        txtStatusLastScan.text = statusScan
        txtStatusFixMessage.text = statusFix
    }

    Component.onCompleted: {
        switch(settings.pcstatus) {
        case 0:
            imgStatus.source = "res/pcOK.png"
            txtStatusPC.text = qsTr("Your PC is safe.")
            break;
        case 1:
            imgStatus.source = "res/pcExclamation.png"
            txtStatusPC.text = qsTr("Your PC is not safe!")
            break;
        case 2:
            imgStatus.source = "res/pcNotOK.png"
            txtStatusPC.text = qsTr("Your PC is not safe!")
            break;
        }
    }

}



/*##^##
Designer {
    D{i:1;anchors_x:80;anchors_y:60}D{i:2;anchors_x:260;anchors_y:80}
}
##^##*/
