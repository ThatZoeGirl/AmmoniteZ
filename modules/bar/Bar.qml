pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import Quickshell
import AmmoniteZ

import "../../components/"

import "left/"
import "right/"

Variants {
    model: Quickshell.screens

    delegate: StyledWindow {
        required property ShellScreen modelData

        screen: modelData
        name: modelData.name
        visible: Settings.screens.getScreen(modelData.name).shell

        exclusionMode: ExclusionMode.Normal
        exclusiveZone: 28
        implicitWidth: modelData.width
        implicitHeight: modelData.height

        anchors {
            left: true
            right: true
            top: true
        }

        // qmllint disable unresolved-type
        // qmllint disable missing-property
        margins {
            top: 6
            left: 6
            right: 6
            bottom: 6
        }

        mask: Region {
            regions: [menuOpener.area, clock.area]
        }

        Item {
            height: 28
            width: parent.implicitWidth

            anchors {
                left: parent.left
                top: parent.top
                right: parent.right
            }

            Row {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                MenuOpener {
                    id: menuOpener

                    property Region area: Region {
                        item: menuOpener
                    }
                }
            }

            Row {
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                Clock {
                    id: clock

                    property Region area: Region {
                        item: clock
                    }
                }
            }
        }
    }
}
