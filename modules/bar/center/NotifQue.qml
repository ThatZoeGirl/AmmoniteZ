import QtQuick
import QtQuick.Controls
import Quickshell.Services.Notifications

import "../../../components/"
import "../../../services/"

StyledRect {
    clip: true

    implicitWidth: (Notifications.server.trackedNotifications.values.length == 0) ? 0 : (notifCol.implicitWidth + 16)
    implicitHeight: (Notifications.server.trackedNotifications.values.length == 0) ? 0 : (notifCol.implicitHeight + 16)

    radius: 16

    Column {
        id: notifCol
        anchors.centerIn: parent

        spacing: 8

        Repeater {
            model: Notifications.server.trackedNotifications

            delegate: Item {
                id: notifRoot
                required property Notification modelData

                implicitWidth: notifBox.width
                implicitHeight: notifBox.height

                Timer {
                    running: true
                    interval: (notifRoot.modelData.expireTimeout > 0) ? notifRoot.modelData.expireTimeout * 1000 : 5000

                    onTriggered: {
                        console.log("triggered");
                        notifRoot.modelData.expire();
                    }
                }

                StyledRect {
                    id: notifBox

                    implicitWidth: 512
                    implicitHeight: childrenRect.height

                    anchors.centerIn: parent

                    color: "#313244"

                    Column {
                        spacing: -6

                        Row {
                            spacing: 6
                            padding: 6

                            Image {
                                id: notifIcon

                                visible: source != ""
                                source: notifRoot.modelData.image

                                width: 24
                                height: 24
                            }

                            Text {
                                text: notifRoot.modelData.appName

                                height: 24

                                verticalAlignment: Text.AlignVCenter

                                font.bold: true
                                font.pixelSize: 16

                                color: "#fff"
                            }
                        }

                        Text {
                            text: notifRoot.modelData.body

                            font.pixelSize: 13

                            color: "#fff"

                            padding: text ? 6 : 0

                            textFormat: Text.MarkdownText
                        }
                    }

                    MouseArea {
                        anchors.fill: notifBox

                        acceptedButtons: Qt.LeftButton | Qt.RightButton

                        onClicked: button => {
                            switch (button.button) {
                            case Qt.LeftButton:
                                notifRoot.modelData.actions[0].invoke();
                                break;
                            case Qt.RightButton:
                                notifRoot.modelData.dismiss();
                                break;
                            }
                        }
                    }
                }
            }

            onItemRemoved: {
                console.log(Notifications.server.trackedNotifications.values.length);
            }

            onItemAdded: (index, item) => {
                console.log(notifCol.children.length);
                console.log("Added item", item.modelData.appName);
                for (let i = 0; i < item.modelData.actions.length; i++) {
                    console.log(item.modelData.actions[i].text);
                }
            }
        }
    }
}
