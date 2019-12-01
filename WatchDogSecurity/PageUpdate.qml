import QtQuick 2.12
import wds.antivirus 1.0

Rectangle {
    id: pageupdate
    width: 596
    height: 446
    color: "#000000"

    Text {
        id: lblSecurityCenter
        x: 8
        y: 8
        color: "#ffffff"
        text: qsTr("Security Center")
        font.bold: true
        font.pixelSize: 16

        Text {
            id: txtCurrentVersion
            x: 0
            y: 22
            color: "#ffffff"
            text: qsTr("Current Version: X.X.X.X")
            font.pixelSize: 12
        }

        Text {
            id: txtNewestVersion
            x: 0
            y: 42
            color: "#ffffff"
            text: qsTr("Newest Version: X.X.X.X")
            font.pixelSize: 12
        }

        Text {
            id: txtUpdateInfo
            x: 0
            y: 62
            color: "#ffffff"
            text: qsTr("Update WDS / Managed by apt")
            font.pixelSize: 12
        }

        ButtonX {
            id: btnUpdate
            x: 0
            y: 82
            width: 140
            buttonText: "Update"
            enabled: false
        }
    }

    Text {
        id: lblClamAV
        x: 8
        y: 151
        color: "#ffffff"
        text: qsTr("ClamAV")

        Text {
            id: txtNewestVersionAV
            x: 0
            y: 62
            color: "#ffffff"
            text: qsTr("Newest Version: X.X.X.X")
            font.pixelSize: 12
        }

        Text {
            id: txtUpdateInfoAV
            x: 0
            y: 82
            color: "#ffffff"
            text: qsTr("Update ClamAV / Managed by apt")
            font.pixelSize: 12
        }
        font.pixelSize: 16
        font.bold: true
        Text {
            id: txtCurrentVersionAV
            x: 0
            y: 22
            color: "#ffffff"
            text: qsTr("Current Version: X.X.X.X")
            font.pixelSize: 12
        }

        ButtonX {
            id: btnUpdateAV
            x: 0
            y: 102
            width: 140
            buttonText: qsTr("Update ClamAV")
            enabled: false
        }

        ButtonX {
            id: btnUpdateDB
            x: 146
            y: 102
            width: 140
            buttonText: qsTr("Update Database")
            onClicked: av.updateClam()
        }

        Text {
            id: txtDatabaseVersion
            x: 0
            y: 42
            color: "#ffffff"
            text: qsTr("Database Version: X")
            font.pixelSize: 12
        }
    }

    ButtonX {
        id: btnAbout
        x: 448
        y: 398
        width: 140
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
        enabled: true
        buttonText: "About"
        onClicked: pageLoader.source = "PageAbout.qml"
    }

    Component.onCompleted: {
        txtCurrentVersionAV.text = qsTr("Current Version: ") + av.checkVersion()
        txtDatabaseVersion.text = qsTr("Database Version: ") +av.checkVersion(1)
        txtCurrentVersion.text = qsTr("Current Version: ") + av.checkVersion(2)
        txtNewestVersion.text = qsTr("Newest Version: ") + av.checkVersion(3)
        txtNewestVersionAV.text = qsTr("Newest Version: ") + av.checkVersion(4)
    }
}


