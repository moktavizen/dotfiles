pragma ComponentBehavior: Bound

import Quickshell.Services.SystemTray
import QtQuick

Loader {
    id: root
    property int iconSize
    property var parentWindow

    active: SystemTray.items.values.length > 0
    sourceComponent: Group {
        Repeater {
            model: SystemTray.items
            Image {
                id: trayItem
                required property var modelData

                source: modelData.icon
                sourceSize.width: root.iconSize
                sourceSize.height: root.iconSize
                anchors.verticalCenter: parent.verticalCenter

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
