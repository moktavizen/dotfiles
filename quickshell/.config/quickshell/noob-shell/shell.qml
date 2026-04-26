// Needed to use custom quick control style
//@ pragma Env QT_QUICK_CONTROLS_STYLE=Basic

// Needed to use platform tray menu
//@ pragma UseQApplication

import Quickshell
import qs.Modules.StatusBar
import qs.Modules.Menu
import qs.Modules.Notification

ShellRoot {
    StatusBar {}
    Menu {}
    Notification {}
}
