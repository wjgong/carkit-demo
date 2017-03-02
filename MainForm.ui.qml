import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: homeScreen
    width: 1280
    height: 720
    property alias homeLayout: homeLayout
    property alias homeModel: homeModel
    property alias carLogo: carLogo

    state: "startup"

    Image {
        id: carLogo
        x: 256
        y: 176
        width: 100
        height: 100
        scale: 0.1
        antialiasing: false
        fillMode: Image.PreserveAspectCrop
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "images/logo_car.png"
    }

    GridView {
        id: homeLayout
        x: 20
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        anchors.topMargin: 10
        anchors.fill: parent
        interactive: false

        model: homeModel

        cellWidth: 392
        cellHeight: 238
        delegate: Item {
            width: 388
            height: 220
            Rectangle {
                anchors.fill: parent
                color: colorCode
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: icon
            }

            Text {
                x: 5
                text: name
                font.bold: true
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
            }

            MouseArea {
                anchors.fill: parent
                onClicked: homeLayout.currentIndex = index
            }
        }

    }

    Image {
        id: qtLogo
        x: 1083
        y: 620
        width: 100
        height: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        source: "images/logo_qt.png"
    }

    ListModel {
        id: homeModel
        ListElement {
            name: qsTr("Camcorders")
            icon: "images/iconCamcorder.png"
            colorCode: "#183693"
            page: "content/camcorders.qml"
        }

        ListElement {
            name: qsTr("Weather")
            icon: "images/iconWeather.png"
            colorCode: "#183693"
            page: "content/weather.qml"
        }

        ListElement {
            name: qsTr("Compass")
            icon: "images/iconCompass.png"
            colorCode: "#183693"
            page: "content/compass.qml"
        }

        ListElement {
            name: qsTr("Music")
            icon: "images/iconMusic.png"
            colorCode: "#183693"
            page: "content/music.qml"
        }

        ListElement {
            name: qsTr("Navigatior")
            icon: "images/iconNavigator.png"
            colorCode: "#183693"
            page: "content/navigator.qml"
        }

        ListElement {
            name: qsTr("Radio")
            icon: "images/iconRadio.png"
            colorCode: "#183693"
            page: "content/radio.qml"
        }

        ListElement {
            name: qsTr("Message")
            icon: "images/iconMessage.png"
            colorCode: "#183693"
            page: "content/message.qml"
        }

        ListElement {
            name: qsTr("Phone")
            icon: "images/iconPhone.png"
            colorCode: "#183693"
            page: "content/phone.qml"
        }

        ListElement {
            name: qsTr("Settings")
            icon: "images/iconSettings.png"
            colorCode: "#183693"
            page: "content/settings.qml"
        }
    }


    states: [
        State {
            name: "startup"

            PropertyChanges {
                target: homeLayout
                visible: false
            }
        },
        State {
            name: "home"

            PropertyChanges {
                target: carLogo
                visible: false
            }

            PropertyChanges {
                target: qtLogo
                visible: false
            }
        }
    ]

}
