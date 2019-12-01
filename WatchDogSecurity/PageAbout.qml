import QtQuick 2.12

Rectangle {
    id: pageabout
    width: 596
    height: 446
    color: "#000000"

    Text {
        id: lblTitleAbout
        x: 8
        y: 8
        color: "#ffffff"
        text: qsTr("About WatchDogSecurity")
        font.bold: true
        font.pixelSize: 16
    }

    Text {
        id: element
        x: 8
        y: 33
        width: 580
        height: 405
        color: "#ffffff"
        text: "WatchDogSecurity " + av.checkVersion(2) + "\n" +
                   "Copyright (C) 2019 DavidoTek\n" +
                   "Licensed under LGPL 3.0\n" +
                   "Created using Qt"
        font.pixelSize: 12
    }
}
