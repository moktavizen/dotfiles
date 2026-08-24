pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import qs.Common

ListView {
    id: root

    required property var provider
    property string query: ""
    property int lines: 7

    signal itemSelected(var item)

    function selectCurrent(): void {
        if (count > 0 && currentIndex >= 0 && currentIndex < count) {
            itemSelected(model.values[currentIndex]);
        }
    }

    function next(): void {
        if (count > 0) {
            currentIndex = (currentIndex + 1) % count;
        }
    }

    function previous(): void {
        if (count > 0) {
            currentIndex = (currentIndex - 1 + count) % count;
        }
    }

    spacing: 2
    implicitHeight: (currentItem?.implicitHeight * lines) + (spacing * (lines - 1))
    clip: true
    highlightMoveDuration: 0

    model: ScriptModel {
        values: {
            if (!root.provider)
                return [];
            const items = root.provider.items ?? [];
            const q = root.query.trim().toLowerCase();

            if (!q) {
                return items;
            }

            const terms = q.split(" ");
            return items.filter(item => {
                const text = root.provider.getKeywords(item).toLowerCase();
                return terms.every(word => text.includes(word));
            });
        }
    }

    delegate: Control {
        required property var modelData
        required property int index

        width: root.width
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
            onTapped: root.itemSelected(modelData)
        }

        HoverHandler {
            cursorShape: Qt.PointingHandCursor
            onHoveredChanged: {
                if (hovered) {
                    root.currentIndex = index;
                }
            }
        }
    }

    highlight: Rectangle {
        color: Theme.selected
        radius: 8
    }
}
