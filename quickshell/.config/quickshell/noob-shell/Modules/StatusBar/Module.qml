import QtQuick

    ThemedText {
        property alias format: moduleText.text
        property string onClickCmd

        id: moduleText
        textFormat: Text.StyledText

        TapHandler {
            onTapped: {
                if (onClickCmd === "") return
                Quickshell.execDetached(["sh", "-c", onClickCmd])
            }
        }
        HoverHandler {
            enabled: onClickCmd !== ""
            cursorShape: Qt.PointingHandCursor
        }
    }
