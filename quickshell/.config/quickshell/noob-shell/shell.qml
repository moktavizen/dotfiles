// Needed to use custom quick control style
//@ pragma Env QT_QUICK_CONTROLS_STYLE=Basic

// Needed to use platform tray menu
//@ pragma UseQApplication

import Quickshell
import qs.Widgets.Wallpaper
import qs.Widgets.StatusBar
import qs.Widgets.Menu
import qs.Widgets.Notif

ShellRoot {
    Wallpaper {}
    StatusBar {}
    Menu {}
    Notif {}
}
