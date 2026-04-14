pragma ComponentBehavior: Bound

import QtQuick
import qs.Common
import qs.Services

Group {
    id: root
    property string activeIcon
    property string defaultIcon
    property color activeColor

    gap: 0
    horizontalPadding: 10

    Repeater {
        model: Hypr.workspaces
        Rectangle {
            id: workspace
            required property var modelData
            required property int index

            width: childrenRect.width
            height: childrenRect.height
            color: "transparent"

            ThemedText {
                width: 18
                color: workspace.modelData.active ? root.activeColor : Theme.foreground
                text: workspace.modelData.active ? root.activeIcon : root.defaultIcon
                horizontalAlignment: Text.AlignHCenter
            }

            TapHandler {
                onTapped: Hypr.goToWorkspace(workspace.index)
            }
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}
