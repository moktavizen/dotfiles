pragma Singleton

import Quickshell
import Quickshell.Io
import QtQml

Singleton {
    id: root
    property var clipboard: []

    Process {
        id: cliphistProc
        command: ["cliphist", "list"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.clipboard = text.trim().split('\n')
        }
    }

    FileView {
        path: Qt.resolvedUrl("/home/vizen/.cache/cliphist/db")
        watchChanges: true
        onFileChanged: cliphistProc.running = true
    }
}
