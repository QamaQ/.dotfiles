import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland


Item {
    id: barItems
    anchors.fill: parent
    required property PanelWindow panelWindow
    property int margin: 10
    property int separation: 10
    RowLayout {
        id: secRight
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        layoutDirection: Qt.RightToLeft
        // rightPadding: barItems.margin
        spacing: barItems.separation
        SysTray {
            window: panelWindow
        }

        anchors.rightMargin: barItems.separation
    }
    RowLayout {
        id: secLeft
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        layoutDirection: Qt.LeftToRight
        spacing: barItems.separation
        Workspaces {
            Layout.fillHeight: true
        }
        anchors.leftMargin: barItems.separation
    }
}
