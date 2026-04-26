import Quickshell
import Quickshell.Wayland
import QtQuick

Variants {
    model: Quickshell.screens

    PanelWindow {
        required property var modelData
        screen: modelData

        WlrLayershell.layer: WlrLayer.Background
        WlrLayershell.exclusionMode: ExclusionMode.Ignore
        WlrLayershell.namespace: "noobshell-wallpaper"
        anchors.top: true
        anchors.bottom: true
        anchors.left: true
        anchors.right: true

        Image {
            anchors.fill: parent
            source: Quickshell.env("HOME") + "/.config/wallpapers/max-suleimanov-1.avif"
            sourceSize.width: Screen.width
            sourceSize.height: Screen.height
        }
    }
}
