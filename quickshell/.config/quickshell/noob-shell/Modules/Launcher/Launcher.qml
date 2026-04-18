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
    // We get apps outside LazyLoader to prevent expensive calculation when
    // first time loading the launcher
    property var apps: DesktopEntries.applications.values

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
                                text: `${listView.count}/${root.apps.length}`
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
                        Layout.fillWidth: true
                        implicitHeight: 353
                        topMargin: 12
                        bottomMargin: 8
                        spacing: 2
                        clip: true
                        highlightMoveDuration: 0
                        model: ScriptModel {
                            // qmlformat off
                            values: root.apps
                                .filter(d => d.name.toLowerCase().includes(launcher.q.toLowerCase()))
                                .sort((a, b) => a.name.localeCompare(b.name))
                            // qmlformat on
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
                Keys.onPressed: event => {
                    const isCtrl = event.modifiers & Qt.ControlModifier;
                    const isN = event.key === Qt.Key_N;
                    const isP = event.key === Qt.Key_P;
                    const isReturn = event.key === Qt.Key_Return;
                    const isEnter = event.key === Qt.Key_Enter;
                    const isEsc = event.key === Qt.Key_Escape;
                    const isSqBracketLeft = event.key === Qt.Key_BracketLeft;

                    if (isCtrl && isN) {
                        listView.currentIndex++;
                    } else if (isCtrl && isP) {
                        listView.currentIndex--;
                    } else if (isReturn || isEnter) {
                        launcher.launchSelected(listView.currentItem.modelData);
                    } else if (isEsc || (isCtrl && isSqBracketLeft)) {
                        ipc.toggle();
                    }
                }
            }
        }
    }
}
