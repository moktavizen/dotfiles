pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property int updateSec: 2

    property int cpuUsage
    property real lastIdle: 0
    property real lastTotal: 0
    FileView {
        id: cpuFile
        path: "/proc/stat"
        onLoaded: {
            // Parse into [0] user, [1] nice, [2] system, [3] idle, [4] iowait, [5] irq, [6] softirq
            const p = this.text().split(/\s+/).slice(1, 8).map(Number);
            // Like top and vmstat, disk activity isn't counted as CPU work
            const idle = p[3] + (p[4] || 0);
            const total = p.reduce((a, b) => a + b, 0);

            const dIdle = idle - root.lastIdle;
            const dTotal = total - root.lastTotal;
            // CPU ratio (e.g., 0.35 for 35% usage)
            root.cpuUsage = Math.round((1 - dIdle / dTotal) * 100);

            root.lastIdle = idle;
            root.lastTotal = total;
        }
    }

    property int cpuTemp
    FileView {
        id: tempFile
        // Note: Change 'thermal_zone1' if your CPU temp is on a different zone
        path: "/sys/class/thermal/thermal_zone1/temp"
        onLoaded: {
            root.cpuTemp = this.text() / 1000;
        }
    }

    property real memUsed
    FileView {
        id: memFile
        path: "/proc/meminfo"
        onLoaded: {
            const total = this.text().match(/MemTotal:\s+(\d+)/);
            const avail = this.text().match(/MemAvailable:\s+(\d+)/);
            // kB -> GiB
            root.memUsed = (total[1] - avail[1]) / 1048576;
        }
    }

    property int powerCapacity
    FileView {
        id: powerFile
        // Note: Change 'BAT0' if your battery identifier is different (e.g., BAT1)
        path: "/sys/class/power_supply/BAT0/capacity"
        onLoaded: {
            root.powerCapacity = this.text();
        }
    }

    property real downloadMBps: 0
    property real lastBytes: 0
    FileView {
        id: netwFile
        // Note: Replace 'wlp3s0' with your active network interface name
        path: "/sys/class/net/wlp3s0/statistics/rx_bytes"
        onLoaded: {
            const bytes = this.text();
            // (current - previous) converted to MiB/s
            root.downloadMBps = (bytes - root.lastBytes) / 1048576 / root.updateSec;

            root.lastBytes = bytes;
        }
    }

    Timer {
        interval: root.updateSec * 1000
        running: true
        repeat: true
        onTriggered: {
            cpuFile.reload();
            tempFile.reload();
            memFile.reload();
            powerFile.reload();
            netwFile.reload();
        }
    }
}
