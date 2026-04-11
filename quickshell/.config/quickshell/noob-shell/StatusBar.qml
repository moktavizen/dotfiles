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
    property int refreshSec: 2

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

    property int cpuUsage
    Process {
        id: cpuProc
        command: ["sh", "-c", "vmstat 1 2 | awk 'END {print 100 - $15}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: cpuUsage = text
        }
    }

    property int cpuTemp
    Process {
        id: tempProc
        command: ["sh", "-c", "sensors | awk '/id 0/ {print $4+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: cpuTemp = text
        }
    }

    property real memUsed
    Process {
        id: memProc
        command: ["sh", "-c", "free -h | awk '/Mem/ {print $3+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: memUsed = text
        }
    }

    property int battCapacity: UPower.displayDevice.percentage * 100

    property real downloadMBps
    Process {
        id: netwProc
        command: ["sh", "-c", "ifstat | awk '/wlan0/ {print $6}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                downloadMBps = text.includes("K")
                    ? parseInt(text) / 1024 / refreshSec
                    : parseInt(text) / 1024 / 1024 / refreshSec
            }
        }
    }

    property string btStatus: Bluetooth.defaultAdapter?.state == "1" ? "On" : "Off"

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }
    property int speakerVolume: Math.round(Pipewire.defaultAudioSink?.audio.volume * 100)

    SystemClock {
        id: clock;
        precision: SystemClock.Minutes
    }
    property string dateTime: Qt.formatDateTime(clock.date, "ddd MMM d h:mm AP")

    Timer {
        interval: refreshSec * 1000
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
    component ThemedText: Text {
        color: theme.foreground
        font.family: typo.family
        font.pixelSize: typo.pxSize
        font.weight: typo.weight
        font.letterSpacing: typo.letterSpacing
    }
    component HyprWorkspaces: Group {
        property string activeIcon
        property string defaultIcon
        property string activeColor

        gap: 0
        horizontalPadding: 10
        Repeater {
            model: workspaces
            Rectangle {
                required property var modelData
                required property int index

                width: childrenRect.width
                height: childrenRect.height
                color: "transparent"

                ThemedText {
                    width: 18
                    color: modelData.active ? activeColor : theme.foreground
                    text: modelData.active ? activeIcon : defaultIcon
                    horizontalAlignment: Text.AlignHCenter
                }

                TapHandler {
                    onTapped: goToWorkspace(index)
                }
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
    component Module: ThemedText {
        property alias format: moduleText.text
        property string onClickCmd

        id: moduleText
        textFormat: Text.StyledText

        TapHandler {
            onTapped: {
                if (onClickCmd === "") return
                Quickshell.execDetached(["sh", "-c", onClickCmd])
            }
        }
        HoverHandler {
            enabled: onClickCmd !== ""
            cursorShape: Qt.PointingHandCursor
        }
    }
    component HyprWindow: Group {
        property alias format: windowModule.format

        contentItem: RowLayout {
            Module {
                id: windowModule
                Layout.maximumWidth: 603
                elide: Text.ElideMiddle
            }
        }
    }
    component Tray: Group {
        property int iconSize
        property var parentWindow

        visible: hasTrayItems
        Repeater {
            model: trayItems
            Image {
                required property var modelData

                source: modelData.icon
                sourceSize.width: iconSize
                sourceSize.height: iconSize
                anchors.verticalCenter: parent.verticalCenter

                TapHandler {
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onTapped: (eventPoint, button) => {
                        if (button === Qt.LeftButton) {
                            modelData.activate();
                        } else {
                            if (!modelData.hasMenu) return
                            modelData.display(parentWindow, eventPoint.scenePosition.x, eventPoint.scenePosition.y);
                        }
                    }
                }
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: barWindow
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

                HyprWorkspaces {
                    id: wsGroup
                    activeIcon: "󰮯"
                    defaultIcon: "•"
                    activeColor: theme.yellow
                }

                HyprWindow {
                    format: `<font color="${theme.blue}">󰊠</font> ${winTitle}`
                    Layout.maximumHeight: wsGroup.height
                }

                Item {
                    Layout.fillWidth: true
                }

                Tray {
                    Layout.preferredHeight: wsGroup.height
                    iconSize: 16
                    parentWindow: barWindow
                }

                Group {
                    Module {
                        format: `<font color="${theme.paleCyan}">󰍛</font> ${cpuUsage}%`
                        onClickCmd: "foot -T 'Task Manager' btop"
                    }
                    Module {
                        format: `<font color="${theme.red}"></font> ${cpuTemp}C`
                        onClickCmd: "foot -T 'Task Manager' btop"
                    }
                    Module {
                        format: `<font color="${theme.magenta}">󰘚</font> ${memUsed}GB`
                        onClickCmd: "foot -T 'Task Manager' btop"
                    }
                }

                Group {
                    Module {
                        format: `<font color="${theme.green}"></font> ${battCapacity}%`
                        onClickCmd: "foot -T 'Battery Details' sh -c 'upower -i /org/freedesktop/UPower/devices/battery_BAT0; read'"
                    }
                    Module {
                        format: `<font color="${theme.cyan}">󰤨</font> ${downloadMBps.toFixed(1)}MB/s`
                        onClickCmd: "foot -T 'WiFi Manager' impala"
                    }
                    Module {
                        format: `<font color="${theme.blue}"></font> ${btStatus}`
                        onClickCmd: "foot -T 'Bluetooth Manager' bluetui"
                    }
                    Module {
                        format: `<font color="${theme.red}">󰕾</font> ${speakerVolume}%`
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
