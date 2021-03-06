import QtQuick 2.5
import QtQuick.Controls 1.4

Item {
    id: messagePage

    Rectangle {
        id: rectangle1
        width: 1280
        height: 720
        color: "steelblue"

        Image {
            id: back
            x: 31
            y: 18
            z: 1
            source: "qrc:/images/backButton.png"
            MouseArea {
                anchors.fill: parent
                onClicked: stackView.pop()
            }
        }

        Image {
            id: image1
            fillMode: Image.Stretch
            anchors.fill: parent
            source: "../images/ssMessage.png"
        }
    }
}
