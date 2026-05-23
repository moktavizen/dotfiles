pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property var workspaces
    property string winTitle
    function goToWorkspace(n: int): void {
        Quickshell.execDetached(["niri", "msg", "action", "focus-workspace", `${n + 1}`]);
    }

    Process {
        id: winProc
        command: ["niri", "msg", "--json", "windows"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                root.winTitle = JSON.parse(text).find(w => w.is_focused)?.title || "N/A";
            }
        }
    }

    Process {
        id: wsProc
        command: ["niri", "msg", "--json", "workspaces"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                root.workspaces = JSON.parse(text).sort((a, b) => a.idx - b.idx);
            }
        }
    }

    Process {
        command: ["niri", "msg", "--json", "event-stream"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                const ev = JSON.parse(data);
                if (ev.WindowFocusChanged || ev.WindowOpenedOrChanged) {
                    winProc.running = true;
                } else if (ev.WorkspaceActivated || ev.WorkspacesChanged) {
                    wsProc.running = true;
                }
            }
        }
    }
}
