pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property var items: []
    property var onLoaded: null

    Process {
        id: cliphistProc
        command: ["cliphist", "list"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.items = text.trim().split('\n');
                root.onLoaded();
            }
        }
    }

    function loadItems(showMenu: var): void {
        onLoaded = showMenu;
        cliphistProc.running = true;
    }

    function getIcon(_): string {
        return Quickshell.iconPath("arrow-right");
    }

    function getText(cbItem): string {
        return cbItem.split("\t")[1];
    }

    function getKeywords(cbItem): string {
        return cbItem.split("\t")[1];
    }

    function applyAction(cbItem): void {
        const cbId = cbItem.split("\t")[0];
        Quickshell.execDetached(["sh", "-c", `cliphist decode ${cbId} | wl-copy`]);
    }
}
