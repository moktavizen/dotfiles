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
        property color paleCyan: "#b4c8d1"
        property color red: "#f2979c"
        property color yellow: "#f2d297"
    }
    QtObject {
        id: typo
        property string family: "JetBrainsMonoNL Nerd Font Propo"
        property int pxSize: 14
        property int weight: 500
    }
    QtObject {
        id: bar
        property int gap: 8
    }
    QtObject {
        id: group
        property int vPad: 5
        property int hPad: 16
        property int borderRadius: 999
        property int gap: 16
    }
    QtObject {
        id: module
        property int gap: 8
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
            }

            Text {
                id: content
                color: colors.foreground
                font.family: typo.family
                font.pixelSize: typo.pxSize
                font.weight: typo.weight
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
                contentText: "vizen - zsh"
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
                contentText: "1%"
            }

            Module {
                id: temp
                iconSource: ""
                iconColor: colors.red
                contentText: "53C"
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
