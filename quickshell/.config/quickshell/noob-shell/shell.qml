import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

PanelWindow {
    QtObject {
        id: theme
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
            color: theme.background
            radius: group.borderRadius
        }

        contentItem: Row {
            id: content
            spacing: group.gap
        }
    }
    component Module: AbstractButton {
        property alias symbol: iconText.text
        property alias symbolColor: iconText.color
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
                color: theme.foreground
                font.family: typo.family
                font.pixelSize: typo.pxSize
                font.weight: typo.weight
                font.letterSpacing: typo.letterSpacing
            }
        }
    }

    Process {
        id: memProc
        property string memUsage

        command: ["sh", "-c", "free -h | awk 'NR==2{print $3+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: memProc.memUsage = `${this.text.trim()}GB`
        }
    }

    Process {
        id: cpuProc
        property string cpuUsage

        command: ["sh", "-c", "echo $[100 - $(vmstat 1 2 | tail -1 | awk '{print $15}')]"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: cpuProc.cpuUsage = `${this.text.trim()}%`
        }
    }

    Process {
        id: tempProc
        property string cpuTemp

        command: ["sh", "-c", "sensors | awk '/id 0/ {print $4+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: tempProc.cpuTemp = `${this.text.trim()}C`
        }
    }

    SystemClock {
        id: clockProc;
        property string dateTime

        precision: SystemClock.Minutes
        dateTime: Qt.formatDateTime(this.date, "ddd MMM dd hh:mm AP")
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            memProc.running = true
            cpuProc.running = true
            tempProc.running = true
        }
    }

    color: theme.clear
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
                id: workspaces
                symbol: "󰮯"
                symbolColor: theme.yellow
                contentText: "• •"
            }
        }

        Group {
            Module {
                id: windowTitle
                symbol: "󰊠"
                symbolColor: theme.blue
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
                symbol: "󰍛"
                symbolColor: theme.paleCyan
                contentText: cpuProc.cpuUsage
            }

            Module {
                id: temperature
                symbol: ""
                symbolColor: theme.red
                contentText: tempProc.cpuTemp
            }

            Module {
                id: memory
                symbol: "󰘚"
                symbolColor: theme.magenta
                contentText: memProc.memUsage
            }
        }

        Group {
            Module {
                id: battery
                symbol: ""
                symbolColor: theme.green
                contentText: "99%"
            }

            Module {
                id: network
                symbol: "󰤨"
                symbolColor: theme.cyan
                contentText: "1.2  MB/s"
            }

            Module {
                id: bluetooth
                symbol: ""
                symbolColor: theme.blue
                contentText: "on"
            }
            Module {
                id: audio
                symbol: "󰕾"
                symbolColor: theme.red
                contentText: "150%"
            }
        }

        Group {
            Module {
                id: clock
                symbol: "󰥔"
                symbolColor: theme.yellow
                contentText: clockProc.dateTime
            }
        }
    }
}
