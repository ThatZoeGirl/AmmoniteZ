import Quickshell
import QtQuick

import "../../../services/"

import "../../../components/"

StyledRect {
    id: clock

    implicitWidth: inner.width
    implicitHeight: 28

    clip: true

    state: "short"

    states: [
        State {
            name: "short"
            StateChangeScript {}
        }
    ]

    Item {
        id: inner
        width: text.contentWidth + 24

        anchors.centerIn: parent

        Text {
            id: text

            property string version: "short"

            anchors.centerIn: parent

            text: (version == "short") ? Time.short : Time.long
            color: "#fff"

            font.bold: true
            font.pixelSize: 13

            Behavior on version {
                SequentialAnimation {
                    NumberAnimation {
                        target: text
                        property: "opacity"
                        to: 0
                        duration: 150
                    }
                    PropertyAction {}
                    NumberAnimation {
                        target: text
                        property: "opacity"
                        to: 1
                    }
                }
            }
        }
    }

    MouseArea {
        hoverEnabled: true

        anchors.fill: parent

        onEntered: {
            text.version = "long";
        }

        onExited: {
            text.version = "short";
        }
    }
}
