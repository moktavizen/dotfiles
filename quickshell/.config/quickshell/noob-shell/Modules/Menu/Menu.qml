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
    // We get `apps` outside `LazyLoader` to prevent expensive calculation when
    // loading the menu for the first time
    property var apps: DesktopEntries.applications.values.slice().sort((a, b) => a.name.localeCompare(b.name))
    property var emojis: Emoji.emojis

    property string mode
    property var items
    property bool hasIcon
    property var getIcon
    property var getText
    property var getSearchKey
    property var action

    IpcHandler {
        id: ipc
        target: "menu"

        function open(mode: string): void {
            if (loader.active) {
                return;
            }

            root.mode = mode;
            // qmlformat off
            switch (root.mode) {
                case "app":
                    root.items = root.apps;
                    root.hasIcon = true;
                    root.getIcon = item => Quickshell.iconPath(item.icon || "unknown");
                    root.getText = item => item.name;
                    root.getSearchKey = item => item.name;
                    root.action = item => item.execute();
                    break;
                case "emoji":
                    root.items = root.emojis;
                    root.hasIcon = false;
                    root.getIcon = item => "";
                    root.getText = item => `${item.e} - ${item.n}`;
                    root.getSearchKey = item => item.k;
                    root.action = item => Quickshell.execDetached(["wl-copy", item.e]);
                    break;
                case "clipboard":
                    Cliphist.running = true;
                    root.items = Qt.binding(() => Cliphist.clipboard);
                    root.hasIcon = false;
                    root.getIcon = item => "";
                    root.getText = item => item.split("\t")[1]
                    root.getSearchKey = item => item;
                    root.action = item => Quickshell.execDetached(["sh", "-c", `cliphist decode ${item} | wl-copy`]);
                    break;
            }
            // qmlformat off

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
                root.action(item);
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
                                text: `${listView.count}/${root.items.length}`
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
                        onCountChanged: {
                            if (count > 0) {
                                currentIndex = 0;
                            }
                        }
                        model: ScriptModel {
                            values: {
                                function hasWords(str, sentence) {
                                    const nStr = str.toLowerCase();
                                    const nWords = sentence.toLowerCase().split(" ");
                                    return nWords.every(word => nStr.includes(word));
                                }

                                return root.items.filter(item => {
                                    const searchKey = root.getSearchKey(item);
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
                                    visible: root.hasIcon
                                    source: root.getIcon(delegateItem.modelData)
                                    implicitSize: 24
                                }
                                ThemedText {
                                    Layout.fillWidth: true
                                    text: root.getText(delegateItem.modelData)
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
                    onActivated: window.selectItem(listView.model.values[listView.currentIndex])
                }
                Shortcut {
                    sequences: ["Esc", "Ctrl+["]
                    onActivated: ipc.close()
                }
            }
        }
    }
}
