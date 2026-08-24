pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Common
import qs.Providers

Scope {
    id: root

    property var provider: null
    readonly property var providers: ({
            "app": App,
            "emoji": Emoji,
            "clipboard": Clipboard
        })

    IpcHandler {
        id: ipc
        target: "menu"

        function open(mode: string): void {
            if (loader.active) {
                return;
            }

            const selectedProvider = root.providers[mode];
            root.provider = selectedProvider;
            selectedProvider.loadItems(() => {
                loader.active = true;
            });
        }

        function close(): void {
            loader.active = false;
        }
    }

    LazyLoader {
        id: loader

        PanelWindow {
            id: window
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.namespace: "noob-menu"
            BackgroundEffect.blurRegion: Region {
                item: container.background
                radius: container.background.radius
            }
            implicitWidth: container.implicitWidth
            implicitHeight: container.implicitHeight
            color: "transparent"
            focusable: true

            property string q: ""

            function filterItems(items, queryText) {
                if (!queryText.trim()) {
                    return items;
                }
                const terms = queryText.toLowerCase().split(" ");

                return items.filter(item => {
                    const text = root.provider.getKeywords(item).toLowerCase();
                    return terms.every(word => text.includes(word));
                });
            }

            function selectItem(item) {
                root.provider.applyAction(item);
                ipc.close();
            }

            Control {
                id: container
                implicitWidth: 666

                padding: 8
                background: RoundedRect {}
                contentItem: ColumnLayout {
                    spacing: 0
                    Control {
                        Layout.fillWidth: true
                        topPadding: 10
                        bottomPadding: 4
                        horizontalPadding: 12
                        contentItem: RowLayout {
                            spacing: 8
                            IconImage {
                                source: Quickshell.iconPath("search")
                                implicitSize: 24
                            }
                            ThemedTextField {
                                Layout.fillWidth: true
                                placeholderText: "Search..."
                                placeholderTextColor: Theme.foregroundAlt

                                Component.onCompleted: forceActiveFocus()
                                onTextChanged: {
                                    window.q = text;
                                    listView.currentIndex = 0;
                                }
                            }
                            ThemedText {
                                font.pixelSize: 16
                                font.letterSpacing: 0.4
                                text: `${listView.count}/${root.provider.items.length}`
                            }
                        }
                    }
                    MenuSeparator {
                        Layout.fillWidth: true
                        verticalPadding: 8
                        contentItem: Rectangle {
                            implicitHeight: 1
                            color: Theme.selected
                        }
                    }
                    ListView {
                        id: listView
                        property int lines: 7

                        Layout.fillWidth: true
                        spacing: 2
                        implicitHeight: (currentItem?.implicitHeight * lines) + (spacing * (lines - 1))
                        clip: true
                        highlightMoveDuration: 0
                        model: ScriptModel {
                            values: window.filterItems(root.provider.items, window.q)
                        }
                        delegate: Control {
                            required property var modelData
                            required property int index

                            width: listView.width
                            padding: 11
                            contentItem: RowLayout {
                                spacing: 12
                                IconImage {
                                    source: root.provider.getIcon(modelData)
                                    implicitSize: 24
                                }
                                ThemedText {
                                    font.pixelSize: 16
                                    font.letterSpacing: 0.4
                                    Layout.fillWidth: true
                                    text: root.provider.getText(modelData)
                                    elide: Text.ElideRight
                                }
                            }
                            TapHandler {
                                onTapped: window.selectItem(modelData)
                            }
                            HoverHandler {
                                cursorShape: Qt.PointingHandCursor
                                onHoveredChanged: {
                                    if (hovered) {
                                        listView.currentIndex = index;
                                    }
                                }
                            }
                        }
                        highlight: Rectangle {
                            color: Theme.selected
                            radius: 8
                        }
                    }
                }
            }
            Shortcut {
                sequence: "Ctrl+J"
                onActivated: listView.currentIndex = (listView.currentIndex + 1) % listView.count
            }
            Shortcut {
                sequence: "Ctrl+K"
                onActivated: listView.currentIndex = (listView.currentIndex - 1 + listView.count) % listView.count
            }
            Shortcut {
                sequences: ["Return", "Enter"]
                onActivated: window.selectItem(listView.model.values[listView.currentIndex])
            }
            Shortcut {
                sequences: ["Esc", "Ctrl+["]
                onActivated: ipc.close()
            }
        }
    }
}
