pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Polkit
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.Common

Scope {
    id: root
    PolkitAgent {
        id: polkit
    }

    LazyLoader {
        id: loader
        active: polkit.isActive

        PanelWindow {
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.namespace: "noob-polkit"
            BackgroundEffect.blurRegion: Region {
                item: container.background
                radius: container.background.radius
            }
            implicitWidth: container.implicitWidth
            implicitHeight: container.implicitHeight
            color: "transparent"
            focusable: true

            Control {
                id: container
                padding: 16
                background: RoundedRect {}
                contentItem: ColumnLayout {
                    spacing: 8
                    ThemedText {
                        text: `This <font color="${Theme.yellow}">${polkit.flow?.iconName || "action"}</font> needs root access!`
                        font.weight: 700
                        font.pixelSize: 16
                    }
                    ThemedText {
                        text: polkit.flow?.message || ""
                        font.pixelSize: 16
                    }
                    ThemedText {
                        id: infoMsg
                        text: {
                            let msg = "";
                            if (polkit.flow?.failed) {
                                msg = "(Wrong password, try again)";
                            }
                            if (polkit.flow?.supplementaryMessage) {
                                msg = polkit.flow?.supplementaryMessage;
                            }
                            return msg;
                        }
                        color: Theme.red
                        font.pixelSize: 16
                        visible: text !== ""
                    }
                    MenuSeparator {
                        Layout.fillWidth: true
                        verticalPadding: 4
                        horizontalPadding: 0
                        contentItem: Rectangle {
                            implicitHeight: 1
                            color: Theme.selected
                        }
                    }
                    ThemedTextField {
                        Layout.fillWidth: true
                        placeholderText: polkit.flow?.inputPrompt ?? ""
                        echoMode: polkit.flow?.responseVisible ? TextInput.Normal : TextInput.Password
                        passwordCharacter: "*"
                        enabled: infoMsg.text.includes("left to unlock") === false
                        onAccepted: {
                            polkit.flow?.submit(text);
                            text = "";
                        }

                        Component.onCompleted: forceActiveFocus()
                    }
                }
            }
            Shortcut {
                sequences: ["Esc", "Ctrl+["]
                onActivated: {
                    polkit.flow?.cancelAuthenticationRequest();
                }
            }
        }
    }
}
