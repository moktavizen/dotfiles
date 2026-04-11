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
    property var theme: ({
        background: "#cc1e1e1e",
        foreground: "#ebebeb",
        blue: "#97b4f2",
        cyan: "#97d8f2",
        paleCyan: "#b4c8d1",
        red: "#f2979c",
        yellow: "#f2d297",
        magenta: "#cd97f2",
        green: "#cdf297",
    })
    property var typo: ({
        family: "JetBrainsMonoNL Nerd Font Propo",
        pxSize: 14,
        weight: 500,
        letterSpacing: -0.4,
    })

    property var workspaces: Hyprland.workspaces.values
    function goToWorkspace(n) {
        Hyprland.dispatch("workspace " + (n + 1))
    }

    property string winTitle: {
        const title = Hyprland.activeToplevel?.wayland?.title ?? ""
        const wsWindows = Hyprland.focusedWorkspace?.toplevels.values
        return wsWindows?.length ? title : "Empty"
    }

    property var trayItems: SystemTray.items.values
    property bool hasTrayItems: trayItems.length > 0

    property string cpuUsage: "0%"
    Process {
        id: cpuProc
        command: ["sh", "-c", "vmstat 1 2 | awk 'END {print 100 - $15}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: cpuUsage = `${text.trim()}%`
        }
    }

    property string cpuTemp: "00C"
    Process {
        id: tempProc
        command: ["sh", "-c", "sensors | awk '/id 0/ {print $4+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: cpuTemp = `${text.trim()}C`
        }
    }

    property string memUsage: "0.0GB"
    Process {
        id: memProc
        command: ["sh", "-c", "free -h | awk '/Mem/ {print $3+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: memUsage = `${text.trim()}GB`
        }
    }

    property string percentage: `${UPower.displayDevice.percentage * 100}%`

    property string downByte: "0.0MB/s"
    Process {
        id: netwProc
        command: ["sh", "-c", "ifstat | awk '/wlan0/ {print $6}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                const out = text.trim()
                const timerSec = 2
                const downMBps = out.includes("K")
                    ? parseInt(out) / 1024 / timerSec
                    : parseInt(out) / 1024 / 1024 / timerSec
                downByte = `${downMBps.toFixed(1)}MB/s`
            }
        }
    }

    property string powerState: {
        Bluetooth.defaultAdapter?.state == "1" ? "On" : "Off"
    }

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }
    property string volLevel: {
        `${Math.round(Pipewire.defaultAudioSink?.audio.volume * 100)}%`
    }

    SystemClock {
        id: clock;
        precision: SystemClock.Minutes
    }
    property string dateTime: Qt.formatDateTime(clock.date, "ddd MMM d h:mm AP")

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
        property alias gap: content.spacing

        verticalPadding: 5.5;
        horizontalPadding: 15.5;

        background: Rectangle {
            color: theme.background
            radius: 999
        }

        contentItem: Row {
            id: content
            spacing: 15
        }
    }
    component Workspace: AbstractButton {
        required property var modelData
        required property int index

        width: 18
        contentItem: Text {
            color: modelData.active ? theme.yellow : theme.foreground
            font.family: typo.family
            font.pixelSize: typo.pxSize
            font.weight: typo.weight
            font.letterSpacing: typo.letterSpacing
            text: modelData.active ? "󰮯" : "•"
            horizontalAlignment: Text.AlignHCenter
        }

        onClicked: goToWorkspace(index)
        HoverHandler {
            cursorShape: Qt.PointingHandCursor
        }
    }
    component Module: AbstractButton {
        property alias format: moduleText.text
        property alias elide: moduleText.elide
        property string onClickCmd

        contentItem: Text {
            id: moduleText
            color: theme.foreground
            font.family: typo.family
            font.pixelSize: typo.pxSize
            font.weight: typo.weight
            font.letterSpacing: typo.letterSpacing
            textFormat: Text.StyledText
        }

        onClicked: {
            if (onClickCmd === "") return
            Quickshell.execDetached(["sh", "-c", onClickCmd])
        }
        HoverHandler {
            enabled: onClickCmd !== ""
            cursorShape: Qt.PointingHandCursor
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

            color: "transparent"
            anchors.top: true
            anchors.left: true
            anchors.right: true
            implicitHeight: container.implicitHeight + 8

            RowLayout {
                id: container
                anchors.fill: parent
                anchors.topMargin: 8
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                spacing: 8

                Group {
                    gap: 0
                    horizontalPadding: 10
                    Repeater {
                        model: workspaces
                        Workspace {}
                    }
                }

                Group {
                    Layout.maximumHeight: 30
                    contentItem: RowLayout {
                        Module {
                            format: `<font color="${theme.blue}">󰊠</font> ${winTitle}`
                            Layout.maximumWidth: 600
                            elide: Text.ElideMiddle
                        }
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Group {
                    visible: hasTrayItems
                    Repeater {
                        model: trayItems
                        TrayItem {}
                    }
                }

                Group {
                    Module {
                        format: `<font color="${theme.paleCyan}">󰍛</font> ${cpuUsage}`
                        onClickCmd: "foot -T 'Task Manager' btop"
                    }
                    Module {
                        format: `<font color="${theme.red}"></font> ${cpuTemp}`
                        onClickCmd: "foot -T 'Task Manager' btop"
                    }
                    Module {
                        format: `<font color="${theme.magenta}">󰘚</font> ${memUsage}`
                        onClickCmd: "foot -T 'Task Manager' btop"
                    }
                }

                Group {
                    Module {
                        format: `<font color="${theme.green}"></font> ${percentage}`
                        onClickCmd: "foot -T 'Battery Details' sh -c 'upower -i /org/freedesktop/UPower/devices/battery_BAT0; read'"
                    }
                    Module {
                        format: `<font color="${theme.cyan}">󰤨</font> ${downByte}`
                        onClickCmd: "foot -T 'WiFi Manager' impala"
                    }
                    Module {
                        format: `<font color="${theme.blue}"></font> ${powerState}`
                        onClickCmd: "foot -T 'Bluetooth Manager' bluetui"
                    }
                    Module {
                        format: `<font color="${theme.red}">󰕾</font> ${volLevel}`
                        onClickCmd: "foot -T 'Audio Manager' wiremix"
                    }
                }

                Group {
                    Module {
                        format: `<font color="${theme.yellow}">󰥔</font> ${dateTime}`
                        onClickCmd: "foot -T 'Calendar' sh -c 'cal --year; read'"
                    }
                }
            }
        }
    }
}
