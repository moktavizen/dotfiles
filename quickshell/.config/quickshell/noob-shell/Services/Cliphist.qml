pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property alias running: cliphistProc.running
    property var clipboard: []

    Process {
        id: cliphistProc
        command: ["cliphist", "list"]
        stdout: StdioCollector {
            onStreamFinished: root.clipboard = text.trim().split('\n')
        }
    }
}
