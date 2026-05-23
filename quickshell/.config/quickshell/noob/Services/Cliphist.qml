pragma Singleton

import Quickshell
import Quickshell.Io

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

    FileView {
        path: Quickshell.env("HOME") + "/.cache/cliphist/db"
        preload: false
        watchChanges: true
        onFileChanged: cliphistProc.running = true
    }
}
