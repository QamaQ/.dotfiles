import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

Item {
    id: root
    required property PanelWindow window
    implicitWidth: rowLayout.implicitWidth
    implicitHeight: rowLayout.implicitHeight

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        spacing: 5

        Repeater {
            id: trayRepet
            model: SystemTray.items

            delegate: Item {
                id: itemTray
                required property SystemTrayItem modelData
                implicitWidth: 20
                implicitHeight: 20

                Image {
                    id: trayIcon
                    anchors.fill: parent
                    source: modelData.icon
                    sourceSize.width: itemTray.implicitWidth
                    sourceSize.height: itemTray.implicitHeight
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    cursorShape: Qt.PointingHandCursor
                    onClicked: mouse => {
                        if (mouse.button === Qt.RightButton && modelData.hasMenu) {
                            var pos = mapToItem(null, mouse.x, mouse.y);
                            modelData.display(root.window, pos.x, pos.y);
                        }
                    }
                    onDoubleClicked: mouse => {
                        modelData.activate();
                    }
                }
            }
        }
    }
}
