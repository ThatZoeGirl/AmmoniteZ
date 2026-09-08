import Quickshell
import Quickshell.Wayland
import QtQuick

import "../../components/"
import "../../services/"

import "./"

Variants {
    model: Screens.screens

    StyledWindow {
        id: win
        required property ShellScreen modelData

        name: "background"
        screen: modelData

        WlrLayershell.exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Background
        color: "black"
        surfaceFormat.opaque: false

        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        Item {
            id: frame

            anchors.fill: parent

            Loader {
                id: wallpaper
                asynchronous: true

                anchors.fill: parent
                active: true

                sourceComponent: Wallpaper {}
            }
        }
    }
}
