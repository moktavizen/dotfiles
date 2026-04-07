import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

PanelWindow {
    QtObject {
        id: colors
        property color clear: "#00000000"
        property color background: "#cc1e1e1e"
        property color foreground: "#ebebeb"
        property color blue: "#97b4f2"
        property color cyan: "#97d8f2"
        property color paleCyan: "#b4c8d1"
        property color red: "#f2979c"
        property color yellow: "#f2d297"
        property color magenta: "#cd97f2"
        property color green: "#cdf297"
    }
    QtObject {
        id: typo
        property string family: "JetBrainsMonoNL Nerd Font Propo"
        property int pxSize: 14
        property int weight: 500
        property real letterSpacing: -0.4
    }
    QtObject {
        id: bar
        property int gap: 8
    }
    QtObject {
        id: group
        property real vPad: 5.5
        property real hPad: 15.5
        property int borderRadius: 999
        property int gap: 15
    }
    QtObject {
        id: module
        property int gap: 9
    }

    component Group: Control {
        default property alias content: content.data

        verticalPadding: group.vPad;
        horizontalPadding: group.hPad;

        background: Rectangle {
            color: colors.background
            radius: group.borderRadius
        }

        contentItem: Row {
            id: content
            spacing: group.gap
        }
    }
    component Module: AbstractButton {
        property alias iconSource: iconText.text
        property alias iconColor: iconText.color
        property alias contentText: content.text

        contentItem: Row {
            spacing: module.gap

            Text {
                id: iconText
                font.family: typo.family
                font.pixelSize: typo.pxSize
                font.weight: typo.weight
                font.letterSpacing: typo.letterSpacing
            }

            Text {
                id: content
                color: colors.foreground
                font.family: typo.family
                font.pixelSize: typo.pxSize
                font.weight: typo.weight
                font.letterSpacing: typo.letterSpacing
            }
        }
    }

    color: colors.clear
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: container.implicitHeight + bar.gap

    RowLayout {
        id: container
        anchors.fill: parent
        anchors.topMargin: bar.gap
        anchors.leftMargin: bar.gap
        anchors.rightMargin: bar.gap
        spacing: bar.gap

        Group {
            Module {
                id: windowTitle
                iconSource: "󰊠"
                iconColor: colors.blue
                contentText: "Terminal"
            }
        }

        Item {
            id: spacer
            Layout.fillWidth: true
        }

        Group {
            Module {
                id: cpu
                iconSource: "󰍛"
                iconColor: colors.paleCyan
                contentText: "23%"
            }

            Module {
                id: temperature
                iconSource: ""
                iconColor: colors.red
                contentText: "50C"
            }

            Module {
                id: memory
                iconSource: "󰘚"
                iconColor: colors.magenta
                contentText: "2.5GB"
            }
        }

        Group {
            Module {
                id: battery
                iconSource: ""
                iconColor: colors.green
                contentText: "99%"
            }

            Module {
                id: network
                iconSource: "󰤨"
                iconColor: colors.cyan
                contentText: "1.2  MB/s"
            }

            Module {
                id: bluetooth
                iconSource: ""
                iconColor: colors.blue
                contentText: "on"
            }
            Module {
                id: audio
                iconSource: "󰕾"
                iconColor: colors.red
                contentText: "150%"
            }
        }

        Group {
            Module {
                id: clock
                iconSource: "󰥔"
                iconColor: colors.yellow
                contentText: "Sun Apr 05 06:32 PM"
            }
        }
    }
}
