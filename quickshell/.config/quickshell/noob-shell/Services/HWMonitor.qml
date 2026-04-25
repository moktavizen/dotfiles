pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import Quickshell.Services.UPower
import QtQuick

Singleton {
    id: root
    property int refreshSec: 2

    property int cpuUsage
    Process {
        id: cpuProc
        command: ["sh", "-c", "vmstat 1 2 | awk 'END {print 100 - $15}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.cpuUsage = text
        }
    }

    property int cpuTemp
    Process {
        id: tempProc
        command: ["sh", "-c", "sensors | awk '/id 0/ {print $4+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.cpuTemp = text
        }
    }

    property string memUsed
    Process {
        id: memProc
        command: ["sh", "-c", "free -h | awk '/Mem/ {print $3}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.memUsed = text
        }
    }

    property int battCapacity: UPower.displayDevice.percentage * 100

    property real downloadMBps
    Process {
        id: netwProc
        command: ["sh", "-c", "ifstat | awk '/wlan0/ {print $6}'"]
        running: true
        stdout: StdioCollector {
            // qmlformat off
            onStreamFinished: {
                root.downloadMBps = text.includes("K")
                    ? parseInt(text) / 1024 / root.refreshSec
                    : parseInt(text) / 1024 / 1024 / root.refreshSec;
            }
            // qmlformat on
        }
    }

    property string btStatus: Bluetooth.defaultAdapter?.state == "1" ? "On" : "Off"

    Timer {
        interval: root.refreshSec * 1000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true;
            tempProc.running = true;
            memProc.running = true;
            netwProc.running = true;
        }
    }
}
