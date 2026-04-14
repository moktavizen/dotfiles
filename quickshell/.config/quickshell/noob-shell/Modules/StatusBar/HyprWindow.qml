import QtQuick
import QtQuick.Layouts

    Group {
        property alias format: windowModule.format

        contentItem: RowLayout {
            Module {
                id: windowModule
                Layout.maximumWidth: 603
                elide: Text.ElideMiddle
            }
        }
    }
