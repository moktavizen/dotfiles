pragma Singleton

import Quickshell

Singleton {
    property var items: DesktopEntries.applications.values.slice().sort((a, b) => a.name.localeCompare(b.name))

    function loadItems(showMenu: var): void {
        showMenu();
    }

    function getIcon(app): string {
        return Quickshell.iconPath(app.icon, "dialog-question");
    }

    function getText(app): string {
        return app.name;
    }

    function getKeywords(app): string {
        return app.name;
    }

    function applyAction(app): void {
        app.execute();
    }
}
