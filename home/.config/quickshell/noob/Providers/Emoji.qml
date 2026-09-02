pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    // Run this command if emojis.json does not exist
    // curl -fsSL 'https://github.com/muan/emojilib/raw/main/dist/emoji-en-US.json' \
    // | jq -c 'to_entries | map({
    //   e: .key,
    //   n: (.value[0] | gsub("_"; " ")),
    //   k: (.value | join(" "))
    // })' >emojis.json
    FileView {
        id: emojiFile
        path: Qt.resolvedUrl("./emojis.json")
        blockLoading: true
    }
    property var items: JSON.parse(emojiFile.text())

    function loadItems(showMenu: var): void {
        showMenu();
    }

    function getIcon(_): string {
        return Quickshell.iconPath("arrow-right");
    }

    function getText(emoji): string {
        return `${emoji.e} ${emoji.n}`;
    }

    function getKeywords(emoji): string {
        return emoji.k;
    }

    function applyAction(emoji): void {
        Quickshell.execDetached(["wl-copy", emoji.e]);
    }
}
