import QtQuick
import QtQuick.Effects

import "../services/"

RectangularShadow {
    id: root

    anchors.fill: parent

    radius: parent.radius
    color: "#80000000"

    spread: 1
    blur: 30
}
