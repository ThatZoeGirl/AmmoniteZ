pragma ComponentBehavior: Bound

import QtQuick
import AmmoniteZ

Item {
    id: root
    property string source: Settings.background.active
    property Image current
    property bool completed

    onSourceChanged: {
        if (!source)
            current = null;
        else
            current = imgComp.createObject(this, {
                source: source
            });
    }

    Component.onCompleted: {
        if (source)
            Qt.callLater(() => {
                current = imgComp.createObject(this, {
                    source: source
                });
                completed = true;
            });
    }

    Component {
        id: imgComp

        Image {
            id: img

            asynchronous: true

            anchors.fill: parent

            fillMode: Image.PreserveAspectCrop
            opacity: 0

            onStatusChanged: {
                if (status === Image.Ready)
                    anim.start();
            }

            PropertyAnimation {
                id: anim

                target: img
                property: "opacity"
                from: 0
                to: 1

                duration: 500
            }

            Timer {
                running: root.current !== img && root.current?.status === Image.Ready
                interval: anim.duration
                onTriggered: img.destroy()
            }
        }
    }
}
