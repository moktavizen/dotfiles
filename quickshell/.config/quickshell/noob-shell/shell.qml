import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

PanelWindow {
    id: bar

    property color clrNone: "#00000000"
    property color clrFg: "#ebebeb"
    property color clrBg: "#cc1e1e1e"
    property color clrWindowTitle: "#97b4f2"
    property color clrCPU: "#b6cad2"
    property color clrTemp: "#f2979c"
    property color clrClock: "#f2d297"
    property string fontFamily: "JetBrainsMonoNL Nerd Font Propo"
    property int fontPxSize: 14
    property int fontWeight: 500
    property int gap: 8

    component Menu: Control {
        default property alias content: content.data

        topPadding: 5
        bottomPadding: 5
        leftPadding: 16
        rightPadding: 16

        background: Rectangle {
            color: bar.clrBg
            radius: 999
        }

        contentItem: RowLayout {
            id: content
            spacing: 16
        }
    }

    component Module: RowLayout {
        property alias icon: icon.text
        property alias color: icon.color
        property alias text: text.text

        spacing: 8

        Text {
            id: icon
            font.family: bar.fontFamily
            font.pixelSize: bar.fontPxSize
            font.weight: bar.fontWeight
        }

        Text {
            id: text
            color: bar.clrFg
            font.family: bar.fontFamily
            font.pixelSize: bar.fontPxSize
            font.weight: bar.fontWeight
        }
    }

    color: clrNone
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: container.implicitHeight + gap

    RowLayout {
        id: container
        anchors.fill: parent
        anchors.topMargin: bar.gap
        anchors.leftMargin: bar.gap
        anchors.rightMargin: bar.gap
        spacing: bar.gap

        Menu {
            Module {
                id: windowTitle
                icon: "󰊠"
                color: bar.clrWindowTitle
                text: "vizen - zsh"
            }
        }

        Item {
            id: spacer
            Layout.fillWidth: true
        }

        Menu {
            Module {
                id: cpu
                icon: "󰍛"
                color: bar.clrCPU
                text: "1%"
            }

            Module {
                id: temp
                icon: ""
                color: bar.clrTemp
                text: "53C"
            }
        }

        Menu {
            Module {
                id: clock
                icon: "󰥔"
                color: bar.clrClock
                text: "Sun Apr 05 06:32 PM"
            }
        }
    }
}
