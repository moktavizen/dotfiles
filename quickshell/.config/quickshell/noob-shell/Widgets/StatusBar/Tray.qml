pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick

Loader {
    id: root
    property int iconSize
    property QsWindow parentWindow

    active: SystemTray.items.values.length > 0
    sourceComponent: Group {
        Repeater {
            model: SystemTray.items
            IconImage {
                id: trayItem
                required property SystemTrayItem modelData

                source: modelData.icon
                implicitSize: root.iconSize
                anchors.verticalCenter: parent?.verticalCenter

                TapHandler {
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onTapped: (eventPoint, button) => {
                        if (button === Qt.LeftButton) {
                            trayItem.modelData.activate();
                        } else {
                            if (!trayItem.modelData.hasMenu)
                                return;
                            trayItem.modelData.display(root.parentWindow, eventPoint.scenePosition.x, eventPoint.scenePosition.y);
                        }
                    }
                }
                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
}
