pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import QtQuick

Singleton {
    id: root
    property int updateSec: 2

    property int cpuUsage
    Process {
        id: cpuProc
        command: ["vmstat", "1", "2"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                let lines = text.trim().split("\n");
                let val = lines[lines.length - 1].trim().split(/\s+/)[14];
                root.cpuUsage = 100 - parseInt(val);
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
        command: ["free", "-h"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                let line = text.split("\n").find(l => l.includes("Mem:"));
                if (line) {
                    let val = line.trim().split(/\s+/)[2];
                    // Mebibyte -> Gibibyte
                    root.memUsed = val.includes("Mi") ? parseFloat(val) / 1024 : parseFloat(val);
                }
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

    property real downloadMBps
    Process {
        id: netwProc
        command: ["ifstat"]
        running: true
        stdout: StdioCollector {
            // qmlformat off
            onStreamFinished: {
                let line = text.split("\n").find(l => l.includes("wlp3s0"));
                if (line) {
                    let val = line.trim().split(/\s+/)[5];
                    // Kilobyte or byte -> Mebibyte
                    root.downloadMBps = val.includes("K")
                        ? parseInt(val) / 1049 / root.updateSec
                        : parseInt(val) / 1049 / 1049 / root.updateSec;
                }
            }
            // qmlformat on
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
