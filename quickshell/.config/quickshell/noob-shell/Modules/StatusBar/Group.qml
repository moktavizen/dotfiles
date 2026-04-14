import QtQuick
import QtQuick.Controls
import qs.Common

Control {
    default property alias content: content.data
    property alias gap: content.spacing

    verticalPadding: 5.5
    horizontalPadding: 15.5

    background: Rectangle {
        color: Theme.background
        radius: 999
    }

    contentItem: Row {
        id: content
        spacing: 15
    }
}
