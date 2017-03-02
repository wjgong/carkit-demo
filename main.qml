import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Carkit")

    MainForm {
        id: carMainForm
        anchors.fill: parent

        Component.onCompleted: {
            homeLayout.currentIndex = -1;
            carLogoAni.start();
        }

        NumberAnimation {
            id: carLogoAni
            target: carMainForm.carLogo
            property: "scale"
            to: 4.0
            duration: 3000
            easing.type: Easing.OutBounce

            onStopped: carMainForm.state = "home"
        }

        transitions: [
            Transition {
                from: "startup"
                to: "home"
                NumberAnimation {
                    target: carMainForm.homeLayout
                    property: "opacity"
                    from: 0.0
                    to: 1.0
                    duration: 4000
                }
            }
        ]

        homeLayout.onCurrentIndexChanged: {
            if (carMainForm.state === "home") {
                var index = homeLayout.currentIndex;
                if (index != -1) {
                    console.log("current index" + index);
                    homeLayout.currentIndex = -1;
                    stackView.push(Qt.resolvedUrl(homeModel.get(index).page));
                }
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: carMainForm
    }
}
