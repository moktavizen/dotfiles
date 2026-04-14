import QtQuick
import qs.Common
import qs.Services

Group {
    property string activeIcon
    property string defaultIcon
    property string activeColor

    gap: 0
    horizontalPadding: 10

    Repeater {
        model: Hypr.workspaces
        Rectangle {
            required property var modelData
            required property int index

            width: childrenRect.width
            height: childrenRect.height
            color: "transparent"

            ThemedText {
                width: 18
                color: modelData.active ? activeColor : Theme.foreground
                text: modelData.active ? activeIcon : defaultIcon
                horizontalAlignment: Text.AlignHCenter
            }

            TapHandler {
                onTapped: Hypr.goToWorkspace(index)
            }
            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}
