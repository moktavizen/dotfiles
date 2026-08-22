pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import QtQuick

Singleton {
    id: root
    property int updateSec: 2

    property int cpuUsage
    property real lastIdle: 0
    property real lastTotal: 0
    Process {
        id: cpuProc
        command: ["cat", "/proc/stat"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                const p = text.split(/\s+/).slice(1, 8).map(Number);
                const total = p.reduce((a, b) => a + b, 0);
                const idle = p[3] + (p[4] || 0);

                const dTotal = total - root.lastTotal;
                const dIdle = idle - root.lastIdle
                root.cpuUsage = Math.round((1 - dIdle / dTotal) * 100);

                root.lastIdle = idle;
                root.lastTotal = total;
            }
        }
    }

    property int cpuTemp
    Process {
        id: tempProc
        command: ["cat", "/sys/class/thermal/thermal_zone1/temp"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.cpuTemp = text/1000
        }
    }

    property real memUsed
    Process {
        id: memProc
        command: ["cat", "/proc/meminfo"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                const total = text.match(/MemTotal:\s+(\d+)/);
                const avail = text.match(/MemAvailable:\s+(\d+)/);
                // kB -> GiB
                root.memUsed = (total[1] - avail[1]) / 1048576;
            }
        }
    }

    property int powerCapacity
    Process {
        id: powerProc
        command: ["cat", "/sys/class/power_supply/BAT0/capacity"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                root.powerCapacity = text
            }
        }
    }

    property real downloadMBps: 0
    property real lastBytes: 0
    Process {
        id: netwProc
        command: ["cat", "/sys/class/net/wlp3s0/statistics/rx_bytes"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                const bytes = parseInt(text);
                // (current - previous) converted to MiB/s
                root.downloadMBps = (bytes - root.lastBytes) / 1048576 / root.updateSec;

                root.lastBytes = bytes;
            }
        }
    }

    property string btStatus: Bluetooth.defaultAdapter?.state == "1" ? "On" : "Off"

    Timer {
        interval: root.updateSec * 1000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true;
            tempProc.running = true;
            memProc.running = true;
            powerProc.running = true;
            netwProc.running = true;
        }
    }
}
