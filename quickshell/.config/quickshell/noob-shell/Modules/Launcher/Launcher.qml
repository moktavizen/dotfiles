pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Common

Scope {
    id: root
    // We get sortedApps outside LazyLoader to prevent expensive calculation when
    // loading the launcher for the first time
    property var sortedApps: DesktopEntries.applications.values.slice().sort((a, b) => a.name.localeCompare(b.name))
    property var emojis: []
    property string mode

    IpcHandler {
        id: ipc
        target: "launcher"

        function reveal(mode: string): void {
            if (loader.active) {
                return;
            }
            root.mode = mode;
            loader.active = true;
        }

        function hide(): void {
            loader.active = false;
        }
    }

    LazyLoader {
        id: loader

        PanelWindow {
            id: launcher
            implicitWidth: content.implicitWidth
            implicitHeight: content.implicitHeight
            color: "transparent"
            focusable: true

            property string q: ""
            // qmlformat off
            property var entries: {
                switch (root.mode) {
                    case "drun":
                        return root.sortedApps;
                    case "emojis":
                        return root.emojis;
                }
            }
            property var filterEntries: {
                switch (root.mode) {
                    case "drun":
                        return app => app.name.toLowerCase().includes(launcher.q.toLowerCase())
                    case "emoji":
                        return;
                }
            }
            // qmlformat on

            function launchSelected(desktopEntry) {
                desktopEntry.execute();
                ipc.hide();
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
                                    launcher.q = text;
                                    listView.currentIndex = 0;
                                }
                            }
                            ThemedText {
                                text: `${listView.count}/${launcher.entries.length}`
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
                            values: launcher.entries.filter(launcher.filterEntries)
                        }
                        delegate: Control {
                            id: element
                            required property var modelData
                            required property int index

                            width: listView.width
                            padding: 11
                            contentItem: RowLayout {
                                spacing: 12
                                IconImage {
                                    source: Quickshell.iconPath(element.modelData.icon || "unknown")
                                    implicitSize: 24
                                }
                                ThemedText {
                                    Layout.fillWidth: true
                                    text: element.modelData.name
                                }
                            }
                            TapHandler {
                                onTapped: listView.currentIndex = element.index
                                onDoubleTapped: launcher.launchSelected(element.modelData)
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
                    onActivated: launcher.launchSelected(listView.model.values[listView.currentIndex])
                }
                Shortcut {
                    sequences: ["Esc", "Ctrl+["]
                    onActivated: ipc.hide()
                }
            }
        }
    }
}
