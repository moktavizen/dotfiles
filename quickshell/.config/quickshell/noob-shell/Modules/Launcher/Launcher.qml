pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Common

Scope {
    IpcHandler {
        id: ipc
        target: "launcher"

        function toggle(): void {
            loader.active = !loader.active;
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

            function launchSelected(desktopEntry) {
                desktopEntry.execute();
                ipc.toggle();
            }

            Control {
                id: content
                implicitWidth: 666

                horizontalPadding: 8
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
                        horizontalPadding: 12
                        topPadding: 18
                        bottomPadding: 12
                        contentItem: RowLayout {
                            spacing: 8
                            IconImage {
                                source: Quickshell.iconPath("search")
                                implicitSize: 24
                            }
                            ThemedTextField {
                                Layout.fillWidth: true
                                padding: 0
                                placeholderText: "Search..."
                                background: null

                                Component.onCompleted: forceActiveFocus()
                                onTextChanged: {
                                    launcher.q = text;
                                    listView.currentIndex = 0;
                                }
                            }
                            ThemedText {
                                text: `${listView.count}/${listView.elementCount}`
                            }
                        }
                    }
                    MenuSeparator {
                        Layout.fillWidth: true
                        verticalPadding: 0
                        contentItem: Rectangle {
                            implicitHeight: 1
                            color: Theme.border
                        }
                    }
                    ListView {
                        id: listView
                        property int elementCount: DesktopEntries.applications.values.length

                        Layout.fillWidth: true
                        implicitHeight: 353
                        topMargin: 12
                        bottomMargin: 8
                        spacing: 2
                        clip: true
                        highlightMoveDuration: 0
                        // qmlformat off
                        model: ScriptModel {
                            values: DesktopEntries.applications.values
                                .filter(d => d.name.toLowerCase().includes(launcher.q.toLowerCase()))
                                .sort((a, b) => a.name.localeCompare(b.name))
                        }
                        // qmlformat on
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
            }
        }
    }
}
