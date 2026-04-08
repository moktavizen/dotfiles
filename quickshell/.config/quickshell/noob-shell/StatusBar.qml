import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import Quickshell.Bluetooth
import Quickshell.Services.Pipewire
import Quickshell.Hyprland
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

    Connections {
        id: windowProc
        property string winTitle

        target: Hyprland
        function onRawEvent(event) {
            if (event.name === "activewindowv2") {
                const title = Hyprland.activeToplevel.title
                windowProc.winTitle = title.length > 70 ? `${title.slice(0, 70)}…` : title;
            } else if (event.name === "workspacev2") {
                const windowCount = Hyprland.focusedWorkspace.toplevels.values.length
                if (windowCount === 0) {
                    windowProc.winTitle = "No Window"
                }
            }
        }
    }
    Process {
        id: cpuProc
        property string cpuUsage: "0%"

        command: ["sh", "-c", "vmstat 1 2 | awk 'END {print 100 - $15}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: cpuProc.cpuUsage = `${text.trim()}%`
        }
    }
    Process {
        id: tempProc
        property string cpuTemp: "00C"

        command: ["sh", "-c", "sensors | awk '/id 0/ {print $4+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: tempProc.cpuTemp = `${text.trim()}C`
        }
    }
    Process {
        id: memProc
        property string memUsage: "0.0GB"

        command: ["sh", "-c", "free -h | awk '/Mem/ {print $3+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: memProc.memUsage = `${text.trim()}GB`
        }
    }
    QtObject {
        id: battProc
        property string battPercentage: {
            `${UPower.displayDevice.percentage * 100}%`
        }
    }
    Process {
        id: netwProc
        property string downByte: "0.0MB/s"

        command: ["sh", "-c", "ifstat | awk '/wlan0/ {print $6}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                const out = text.trim()
                const timerSec = 2
                const downMBps = out.includes("K")
                    ? parseInt(out) / 1024 / timerSec
                    : parseInt(out) / 1024 / 1024 / timerSec
                netwProc.downByte = `${downMBps.toFixed(1)}MB/s`
            }
        }
    }
    QtObject {
        id: btooProc
        property string powerState: {
            Bluetooth.defaultAdapter?.state == "1" ? "On" : "Off"
        }
    }
    PwObjectTracker {
        id: volProc
        objects: [Pipewire.defaultAudioSink]
        property string volLevel: {
            `${Math.round(Pipewire.defaultAudioSink?.audio.volume * 100)}%`
        }
    }
    SystemClock {
        id: clockProc;
        precision: SystemClock.Minutes
        property string dateTime: {
            Qt.formatDateTime(date, "ddd MMM dd hh:mm AP")
        }
    }
    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true
            tempProc.running = true
            memProc.running = true
            netwProc.running = true
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData

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
                        contentText: windowProc.winTitle
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
                        contentText: battProc.battPercentage
                    }

                    Module {
                        id: network
                        symbol: "󰤨"
                        symbolColor: theme.cyan
                        contentText: netwProc.downByte
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
                        contentText: volProc.volLevel
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
