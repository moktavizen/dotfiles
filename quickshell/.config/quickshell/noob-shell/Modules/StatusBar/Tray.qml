import Quickshell.Services.SystemTray
import QtQuick

Loader {
    property int iconSize
    property var parentWindow

    active: SystemTray.items.values.length > 0
    sourceComponent: Group {
        Repeater {
            model: SystemTray.items
            Image {
                required property var modelData

                source: modelData.icon
                sourceSize.width: iconSize
                sourceSize.height: iconSize
                anchors.verticalCenter: parent.verticalCenter

                TapHandler {
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onTapped: (eventPoint, button) => {
                        if (button === Qt.LeftButton) {
                            modelData.activate();
                        } else {
                            if (!modelData.hasMenu)
                                return;
                            modelData.display(parentWindow, eventPoint.scenePosition.x, eventPoint.scenePosition.y);
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
