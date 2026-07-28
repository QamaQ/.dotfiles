import QtQuick
import Quickshell
import Quickshell.Wayland
import QtQuick.Layouts
import "../services"

Scope {
    id: root
    property var notificationObject

    PanelWindow {
        anchors {
            top: true
            right: true
            bottom: true
        }
        implicitWidth: 400
        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.namespace: "quickshell:notificationPopup"
        WlrLayershell.layer: WlrLayer.Overlay
        color: "transparent"
        ColumnLayout {
            id: bannerColumn
            width: parent.width
            Repeater {
                model: Notification.list
                delegate: Rectangle {
                    id: card
                    required property var modelData
                    Layout.fillWidth: true
                    Layout.margins: 8
                    height: 60
                    color: "#212121"
                    radius: 8
                    RowLayout {
                        anchors {
                            fill: parent
                            margins: 12
                        }
                        Image {
                            Layout.preferredWidth: 40
                            Layout.preferredHeight: 40
                            source: modelData.resolvedIcon
                        }
                    }
                }
            }
        }
    }
}
