pragma Singleton

import Quickshell
import Quickshell.Io
import QtQml

Singleton {
    property var emojis: JSON.parse(emojiFile.text())

    FileView {
        id: emojiFile
        path: Qt.resolvedUrl("./emojis.json")
        blockLoading: true
    }
}
