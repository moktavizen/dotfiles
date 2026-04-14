pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import Quickshell.Services.UPower
import QtQuick

Singleton {
    property int refreshSec: 2
    property int cpuUsage
    Process {
        id: cpuProc
        command: ["sh", "-c", "vmstat 1 2 | awk 'END {print 100 - $15}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: cpuUsage = text
        }
    }

    property int cpuTemp
    Process {
        id: tempProc
        command: ["sh", "-c", "sensors | awk '/id 0/ {print $4+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: cpuTemp = text
        }
    }

    property real memUsed
    Process {
        id: memProc
        command: ["sh", "-c", "free -h | awk '/Mem/ {print $3+0}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: memUsed = text
        }
    }

    property int battCapacity: UPower.displayDevice.percentage * 100

    property real downloadMBps
    Process {
        id: netwProc
        command: ["sh", "-c", "ifstat | awk '/wlan0/ {print $6}'"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                downloadMBps = text.includes("K") ? parseInt(text) / 1024 / refreshSec : parseInt(text) / 1024 / 1024 / refreshSec;
            }
        }
    }

    property string btStatus: Bluetooth.defaultAdapter?.state == "1" ? "On" : "Off"

    Timer {
        interval: refreshSec * 1000
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
