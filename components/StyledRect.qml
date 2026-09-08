import QtQuick

import "../services"

Rectangle {
    id: root

    color: Config.colours.surface0
    radius: 12

    Behavior on x {
        SpringAnimation {
            damping: 0.4
            spring: 3
        }
    }

    Behavior on y {
        SpringAnimation {
            damping: 0.4
            spring: 3
        }
    }

    Behavior on implicitWidth {
        SpringAnimation {
            damping: 0.4
            spring: 3
        }
    }

    Behavior on implicitHeight {
        SpringAnimation {
            damping: 0.4
            spring: 3
        }
    }
}
