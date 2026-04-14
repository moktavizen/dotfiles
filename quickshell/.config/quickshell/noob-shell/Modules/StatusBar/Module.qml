import Quickshell
import QtQuick

ThemedText {
    id: root
    property alias format: root.text
    property string onClickCmd
    textFormat: Text.StyledText

    TapHandler {
        onTapped: {
            if (root.onClickCmd === "")
                return;
            Quickshell.execDetached(["sh", "-c", root.onClickCmd]);
        }
    }
    HoverHandler {
        enabled: root.onClickCmd !== ""
        cursorShape: Qt.PointingHandCursor
    }
}
