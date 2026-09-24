import Quickshell
import QtQuick
import AmmoniteZ

import "./modules/background/"
import "./modules/bar/"

ShellRoot {
    id: root
    settings.watchFiles: true

    property bool screensReady: false
    Component.onCompleted: {
        for (let i = 0; i < Quickshell.screens.length; i++) {
            const name = Quickshell.screens[i].name;
            Settings.screens.addScreen(name);
            console.log("made screen", name);
        }
        screensReady = true;
    }

    Loader {
        active: root.screensReady
        sourceComponent: Background {}
    }

    Loader {
        active: root.screensReady
        sourceComponent: Bar {}
    }
}
