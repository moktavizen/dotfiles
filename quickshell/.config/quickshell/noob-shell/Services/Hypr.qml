pragma Singleton

import Quickshell
import Quickshell.Hyprland
import QtQuick

Singleton {
  property var workspaces: Hyprland.workspaces

  function goToWorkspace(n: int) {
    Hyprland.dispatch("workspace " + (n + 1))
  }

  property string winTitle: {
    const title = Hyprland.activeToplevel?.wayland?.title ?? ""
    const wsWindows = Hyprland.focusedWorkspace?.toplevels.values
    return wsWindows?.length ? title : "Empty"
  }
}
