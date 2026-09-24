pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string rawTime: "00 00 00 00 00 00"

    property string short
    property string long

    function update() {
        let sects = rawTime.split(" ");
        short = `${sects[0]}:${sects[1]}`;
        long = `${sects[0]}:${sects[1]}:${sects[2]} ${sects[3]}-${sects[4]}`;
    }

    Timer {
        interval: 1000

        running: true
        repeat: true

        onTriggered: timeCmd.running = true
    }

    Process {
        id: timeCmd

        running: true
        command: ["date", "+%H %M %S %d %m %y"]

        stdout: StdioCollector {
            onStreamFinished: {
                root.rawTime = this.text;
                root.update();
            }
        }
    }
}
