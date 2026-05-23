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
        model: WMan.workspaces
        Rectangle {
            id: workspace
            required property var modelData
            required property int index

            width: childrenRect.width
            height: childrenRect.height
            color: "transparent"

            ThemedText {
                width: 18
                color: workspace.modelData.is_active ? root.activeColor : Theme.foreground
                text: workspace.modelData.is_active ? root.activeIcon : root.defaultIcon
                horizontalAlignment: Text.AlignHCenter
            }

            TapHandler {
                onTapped: WMan.goToWorkspace(workspace.index)
            }
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}
