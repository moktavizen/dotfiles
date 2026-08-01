pragma Singleton

import Quickshell
import QtQuick

Singleton {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    property string dateTime: Qt.formatDateTime(clock.date, "ddd MMM d h:mm AP")
}
