import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Scope {
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
        id: cpuProc
        property string cpuUsage: "0%"

        command: ["sh", "-c", "vmstat 1 2 | awk 'END {print 100 - $15}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: cpuProc.cpuUsage = `${this.text.trim()}%`
        }
    }
    Process {
        id: tempProc
        property string cpuTemp: "00C"

        command: ["sh", "-c", "sensors | awk '/id 0/ {print $4+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: tempProc.cpuTemp = `${this.text.trim()}C`
        }
    }
    Process {
        id: memProc
        property string memUsage: "0.0GB"

        command: ["sh", "-c", "free -h | awk '/Mem/ {print $3+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: memProc.memUsage = `${this.text.trim()}GB`
        }
    }
    Process {
        id: battProc
        property string batt: "00%"

        command: ["sh", "-c", "cat /sys/class/power_supply/BAT0/capacity"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: battProc.batt = `${this.text.trim()}%`
        }
    }
    QtObject {
        id: btooProc
        property string powerState: Bluetooth.defaultAdapter.state == "1" ? "On" : "Off"
    }
    SystemClock {
        id: clockProc;
        property string dateTime: Qt.formatDateTime(this.date, "ddd MMM dd hh:mm AP")

        precision: SystemClock.Minutes
    }
    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true
            tempProc.running = true
            memProc.running = true
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
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
                        contentText: battProc.batt
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
                        contentText: btooProc.powerState
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
    }
}
