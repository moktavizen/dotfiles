pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Common
import qs.Services

Scope {
    id: root
    // We get the list data here to prevent race condition with list highlight
    property var apps: DesktopEntries.applications.values.slice().sort((a, b) => a.name.localeCompare(b.name))
    property var emojis: Emoji.emojis
    property var clipboard: Cliphist.clipboard

    property string mode

    property var state: {
        switch (root.mode) {
        case "app":
            return {
                items: root.apps,
                getIcon: item => Quickshell.iconPath(item.icon || "unknown"),
                getText: item => item.name,
                getSearchKey: item => item.name,
                applyAction: item => item.execute()
            };
        case "emoji":
            return {
                items: root.emojis,
                getIcon: item => "",
                getText: item => `${item.e} - ${item.n}`,
                getSearchKey: item => item.k,
                applyAction: item => Quickshell.execDetached(["wl-copy", item.e])
            };
        case "clipboard":
            return {
                items: root.clipboard,
                getIcon: item => "",
                getText: item => item.split("\t")[1],
                getSearchKey: item => item,
                applyAction: item => Quickshell.execDetached(["sh", "-c", `cliphist decode ${item} | wl-copy`])
            };
        }
    }

    IpcHandler {
        id: ipc
        target: "menu"

        function open(mode: string): void {
            if (loader.active) {
                return;
            }

            root.mode = mode;

            loader.active = true;
        }

        function close(): void {
            loader.active = false;
        }
    }

    LazyLoader {
        id: loader

        PanelWindow {
            id: window
            implicitWidth: content.implicitWidth
            implicitHeight: content.implicitHeight
            color: "transparent"
            focusable: true

            property string q: ""

            function selectItem(item) {
                root.state.applyAction(item);
                ipc.close();
            }

            Control {
                id: content
                implicitWidth: 666

                padding: 8
                background: Rectangle {
                    color: Theme.background
                    radius: 12
                    border.width: 1
                    border.color: Theme.border
                }
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

                                Component.onCompleted: forceActiveFocus()
                                onTextChanged: {
                                    window.q = text;
                                    listView.currentIndex = 0;
                                }
                            }
                            ThemedText {
                                text: `${listView.count}/${root.state.items.length}`
                            }
                        }
                    }
                    MenuSeparator {
                        Layout.fillWidth: true
                        verticalPadding: 8
                        contentItem: Rectangle {
                            implicitHeight: 1
                            color: Theme.border
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
                            values: {
                                function hasWords(str, sentence) {
                                    const nStr = str.toLowerCase();
                                    const nWords = sentence.toLowerCase().split(" ");
                                    return nWords.every(word => nStr.includes(word));
                                }

                                return root.state.items.filter(item => {
                                    const searchKey = root.state.getSearchKey(item);
                                    return hasWords(searchKey, window.q);
                                });
                            }
                        }
                        delegate: Control {
                            id: delegateItem
                            required property var modelData
                            required property int index

                            width: listView.width
                            padding: 11
                            contentItem: RowLayout {
                                spacing: 12
                                IconImage {
                                    visible: root.state.getIcon(delegateItem.modelData) !== ""
                                    source: root.state.getIcon(delegateItem.modelData)
                                    implicitSize: 24
                                }
                                ThemedText {
                                    Layout.fillWidth: true
                                    text: root.state.getText(delegateItem.modelData)
                                }
                            }
                            TapHandler {
                                onTapped: listView.currentIndex = delegateItem.index
                                onDoubleTapped: window.selectItem(delegateItem.modelData)
                            }
                            HoverHandler {
                                cursorShape: Qt.PointingHandCursor
                            }
                        }
                        highlight: Rectangle {
                            color: Theme.selected
                            radius: 8
                        }
                    }
                }
                Shortcut {
                    sequence: "Ctrl+J"
                    onActivated: {
                        listView.currentIndex++;
                        if (listView.currentIndex > listView.count - 1) {
                            listView.currentIndex = 0;
                        }
                    }
                }
                Shortcut {
                    sequence: "Ctrl+K"
                    onActivated: {
                        listView.currentIndex--;
                        if (listView.currentIndex < 0) {
                            listView.currentIndex = listView.count - 1;
                        }
                    }
                }
                Shortcut {
                    sequences: ["Return", "Enter"]
                    onActivated: {
                        if (listView.currentItem !== null) {
                            window.selectItem(listView.model.values[listView.currentIndex]);
                        }
                    }
                }
                Shortcut {
                    sequences: ["Esc", "Ctrl+["]
                    onActivated: ipc.close()
                }
            }
        }
    }
}
