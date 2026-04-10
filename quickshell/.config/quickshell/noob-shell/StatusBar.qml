import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Bluetooth
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire
import Quickshell.Services.SystemTray
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
        id: workspaceProc
        property var workspaces: Hyprland.workspaces.values
    }
    QtObject {
        id: windowProc
        property string winTitle: {
            const title = Hyprland.activeToplevel?.title ?? ""
            const wsWindows = Hyprland.focusedWorkspace?.toplevels.values
            return wsWindows?.length ? title : "Empty"
        }
    }
    QtObject {
        id: trayProc
        property var items: SystemTray.items.values
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
            Qt.formatDateTime(date, "ddd MMM d h:mm AP")
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

    component Group: Control {
        default property alias content: content.data
        property int gap: group.gap

        Layout.preferredHeight: 30
        verticalPadding: group.vPad;
        horizontalPadding: group.hPad;

        background: Rectangle {
            color: theme.background
            radius: group.borderRadius
        }

        contentItem: Row {
            id: content
            spacing: gap
        }
    }
    component Module: AbstractButton {
        property string symbol
        property color symbolColor
        property string contentText

        contentItem: Text {
            color: theme.foreground
            font.family: typo.family
            font.pixelSize: typo.pxSize
            font.weight: typo.weight
            font.letterSpacing: typo.letterSpacing
            textFormat: Text.StyledText
            text: `<font color="${symbolColor}">${symbol}</font> ${contentText}`
            elide: Text.ElideMiddle
        }
    }
    component Workspace: AbstractButton {
        required property var modelData

        width: 18
        contentItem: Text {
            color: modelData.active? theme.yellow : theme.foreground
            font.family: typo.family
            font.pixelSize: typo.pxSize
            font.weight: typo.weight
            font.letterSpacing: typo.letterSpacing
            text: modelData.active ? "󰮯" : "•"
            horizontalAlignment: Text.AlignHCenter
        }
    }
    component TrayItem: AbstractButton {
        required property var modelData
        contentItem: Image {
            source: modelData.icon
            sourceSize.width: 16
            sourceSize.height: 16
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
                    gap: 0
                    horizontalPadding: 10
                    Repeater {
                        id: workspaces
                        model: workspaceProc.workspaces
                        Workspace {}
                    }
                }

                Group {
                    contentItem: RowLayout {
                        Module {
                            id: windowTitle
                            symbol: "󰊠"
                            symbolColor: theme.blue
                            contentText: windowProc.winTitle
                            Layout.maximumWidth: 600
                        }
                    }
                }

                Item {
                    id: spacer
                    Layout.fillWidth: true
                }

                Group {
                    visible: trayProc.items.length > 0 ? true : false
                    Repeater {
                        id: systemTray
                        model: trayProc.items
                        TrayItem {}
                    }
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
