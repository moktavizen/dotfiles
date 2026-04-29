pragma ComponentBehavior: Bound

import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Services.Notifications
import qs.Common

Scope {
    id: root
    property Notification notif

    NotificationServer {
        imageSupported: true
        actionIconsSupported: true
        actionsSupported: true
        onNotification: notification => {
            notification.tracked = true;
            root.notif = notification;
            loader.active = true;
            timer.running = true;
        }
    }

    Timer {
        id: timer
        interval: 5000
        onTriggered: {
            if (loader.active) {
                loader.active = false;
                root.notif.expire();
            }
        }
    }

    LazyLoader {
        id: loader

        PanelWindow {
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.namespace: "noob-notif"
            BackgroundEffect.blurRegion: Region {
                item: content.background
                radius: content.background.radius
            }
            anchors.top: true
            anchors.right: true
            margins.top: 16
            margins.right: 16
            implicitWidth: content.implicitWidth
            implicitHeight: content.implicitHeight
            color: "transparent"

            Control {
                id: content
                implicitWidth: contentItem.implicitWidth
                padding: 16
                background: RoundedRect {}
                contentItem: RowLayout {
                    spacing: 16
                    ClippingWrapperRectangle {
                        radius: 10
                        color: "transparent"
                        Image {
                            source: root.notif.appIcon || root.notif.image
                            sourceSize.width: root.notif.appIcon ? 150 : 50
                            sourceSize.height: root.notif.appIcon ? 150 : 50
                        }
                    }
                    ColumnLayout {
                        Layout.maximumWidth: 256
                        spacing: 4
                        ThemedText {
                            font.weight: 700
                            text: root.notif.summary
                            wrapMode: Text.WordWrap
                            maximumLineCount: 2
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }
                        ThemedText {
                            text: root.notif.body
                            wrapMode: Text.WordWrap
                            maximumLineCount: 5
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }
                    }
                }
                TapHandler {
                    onTapped: {
                        if (root.notif.actions) {
                            loader.active = false;
                            root.notif.actions[0]?.invoke();
                        } else {
                            loader.active = false;
                            root.notif.dismiss();
                        }
                    }
                }
            }
        }
    }
}
