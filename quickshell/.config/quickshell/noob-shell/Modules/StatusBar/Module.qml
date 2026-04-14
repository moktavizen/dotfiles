import QtQuick

ThemedText {
    id: moduleText
    property alias format: moduleText.text
    property string onClickCmd
    textFormat: Text.StyledText

    TapHandler {
        onTapped: {
            if (onClickCmd === "")
                return;
            Quickshell.execDetached(["sh", "-c", onClickCmd]);
        }
    }
    HoverHandler {
        enabled: onClickCmd !== ""
        cursorShape: Qt.PointingHandCursor
    }
}
