import QtQuick
import QtQuick.Controls

import "../../../components/"

StyledRect {
    id: menu

    implicitWidth: 28
    implicitHeight: 28

    clip: true

    Button {
        id: menuButton
        anchors.centerIn: parent
        background: Item {}
        icon.source: "./icon.svg"
        icon.width: parent.implicitWidth - 6
        icon.height: parent.implicitHeight - 6
        icon.color: "white"

        Behavior on rotation {
            SpringAnimation {
                id: anim
                spring: 2
                damping: 0.3
                duration: 250

                onRunningChanged: {
                    console.log("state: " + running);
                }
            }
        }

        onHoveredChanged: {
            let delta = menuButton.rotation % 360;
            rotation += (menuButton.hovered) ? 360 - delta : ((delta > 36) ? 0 : -360) - delta;
        }
    }
}
