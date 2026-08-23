pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property list<string> clipboard

    Process {
        id: cliphistProc
        command: ["cliphist", "list"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.clipboard = text.trim().split('\n')
        }
    }

    // Prevent rapid duplicate executions when the DB writes multiple chunks
    Timer {
        id: debounceTimer
        // Waits out all disk I/O bursts while feeling instantaneous
        interval: 50 // ms
        onTriggered: cliphistProc.running = true
    }

    // Run `cliphist list` everytime cliphist db changes
    FileView {
        path: Quickshell.env("HOME") + "/.cache/cliphist/db"
        preload: false
        watchChanges: true
        onFileChanged: debounceTimer.restart()
    }
}
