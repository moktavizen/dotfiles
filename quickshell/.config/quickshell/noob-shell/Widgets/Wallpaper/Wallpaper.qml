import Quickshell
import Quickshell.Wayland
import QtQuick

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: window
        required property ShellScreen modelData
        screen: modelData

        WlrLayershell.layer: WlrLayer.Background
        WlrLayershell.exclusionMode: ExclusionMode.Ignore
        WlrLayershell.namespace: "noob-wallpaper"
        anchors.top: true
        anchors.bottom: true
        anchors.left: true
        anchors.right: true

        Image {
            anchors.fill: parent
            source: Quickshell.env("HOME") + "/.config/wallpapers/max-suleimanov-1.avif"
            fillMode: Image.PreserveAspectCrop
            sourceSize.width: window.modelData.width
            sourceSize.height: window.modelData.height
        }
    }
}
