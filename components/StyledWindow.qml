import Quickshell
import Quickshell.Wayland

// qmllint disable uncreatable-type
PanelWindow {
    required property string name

    WlrLayershell.namespace: `ammonite-z-${name}`
    color: "transparent"
}
