import QtQuick
import Quickshell.Hyprland

Item {
    id: root

    implicitWidth: rowWork.implicitWidth

    Row {
        id: rowWork
        anchors.centerIn: parent
        spacing: 10

        Repeater {
            model: Hyprland.workspaces

            delegate: Rectangle {
                required property HyprlandWorkspace modelData
                readonly property bool isFocused: modelData.focused
                readonly property bool isSpecial: modelData.id < 0
                readonly property bool isOccupied: modelData.toplevels.length > 0
                height: 10
                width: isFocused ? height * 3 : height
                radius: height / 2
                color: isSpecial ? (isFocused ? "red" : (isOccupied ? "blue" : Qt.lighter("blue", 1.5))) : (isFocused ? "#EEFFFF" : Qt.lighter("#212121", 3))
                Behavior on width {
                    NumberAnimation {
                        duration: 150
                    }
                }
                Behavior on color {
                    ColorAnimation {
                        duration: 100
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: modelData.activate()
                }
            }
        }
    }
}
