pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import qs.Common

Control {
    id: root

    property alias text: textField.text
    property int count: 0
    property int totalCount: 0

    signal searchChanged(string text)

    topPadding: 10
    bottomPadding: 4
    horizontalPadding: 12

    contentItem: RowLayout {
        spacing: 8

        IconImage {
            source: Quickshell.iconPath("search")
            implicitSize: 24
        }

        ThemedTextField {
            id: textField
            Layout.fillWidth: true
            placeholderText: "Search..."
            placeholderTextColor: Theme.foregroundAlt

            Component.onCompleted: forceActiveFocus()
            onTextChanged: root.searchChanged(text)
        }

        ThemedText {
            font.pixelSize: 16
            font.letterSpacing: 0.4
            text: `${root.count}/${root.totalCount}`
        }
    }
}
