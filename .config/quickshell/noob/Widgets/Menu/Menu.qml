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
    property var providers: ({
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

            root.provider = root.providers[mode];
            root.provider.loadItems(() => {
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

                    MenuSearchBar {
                        id: searchBar
                        Layout.fillWidth: true
                        count: listView.count
                        totalCount: root.provider.items.length
                    }

                    MenuSeparator {
                        Layout.fillWidth: true
                        verticalPadding: 8
                        contentItem: Rectangle {
                            implicitHeight: 1
                            color: Theme.selected
                        }
                    }

                    MenuListView {
                        id: listView
                        Layout.fillWidth: true
                        provider: root.provider
                        query: searchBar.text
                        onItemSelected: item => window.selectItem(item)
                    }
                }
            }

            Shortcut {
                sequence: "Ctrl+J"
                onActivated: listView.incrementCurrentIndex()
            }
            Shortcut {
                sequence: "Ctrl+K"
                onActivated: listView.decrementCurrentIndex()
            }
            Shortcut {
                sequences: ["Return", "Enter"]
                onActivated: listView.selectCurrent()
            }
            Shortcut {
                sequences: ["Esc", "Ctrl+["]
                onActivated: ipc.close()
            }
        }
    }
}
