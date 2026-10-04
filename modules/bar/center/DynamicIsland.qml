import QtQuick
import Quickshell.Hyprland

import "../../../components/"

StyledRect {
    id: root

    implicitWidth: inner.width
    implicitHeight: 28

    clip: true

    Item {
        id: inner

        width: innerText.contentWidth + 24

        anchors.centerIn: parent

        Text {
            id: innerText
            text: Hyprland.activeToplevel ? Hyprland.activeToplevel.title : "AmmoniteZ"

            font.bold: true
            font.pixelSize: 13
            color: "#fff"

            anchors.centerIn: parent

            Behavior on text {
                SequentialAnimation {
                    NumberAnimation {
                        target: innerText
                        property: "opacity"
                        to: 0
                        duration: 150
                    }
                    PropertyAction {}
                    NumberAnimation {
                        target: innerText
                        property: "opacity"
                        to: 1
                    }
                }
            }
        }
    }
}
