pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Wayland
import QtQuick
import AmmoniteZ

import "../../components/"

import "./"

Variants {
    model: Quickshell.screens

    StyledWindow {
        id: win
        required property ShellScreen modelData

        name: "background"
        screen: modelData

        WlrLayershell.exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: (Settings.screens.getScreen(modelData.name).background) ? WlrLayer.Background : WlrLayer.Bottom
        color: (Settings.screens.getScreen(modelData.name).background) ? "black" : "transparent"
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
                active: Settings.screens.getScreen(win.modelData.name).background

                sourceComponent: Wallpaper {
                    screen: win.modelData
                }
            }
        }
    }
}
