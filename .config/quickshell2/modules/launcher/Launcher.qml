import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick.Layouts
import "../../assets/"

Item {
    id: root
    required property PanelWindow panelWindow
    implicitWidth: launcherButton.implicitWidth
    implicitHeight: launcherButton.implicitHeight
    property bool popupOpen: false
    property string searchText: ""

    function closePopup() {
        root.popupOpen = false;
        root.searchText = "";
    }

    function launchApp(app) {
        if (app && typeof app.execute === "function") {
            app.execute();
        }
        root.closePopup();
    }

    IpcHandler {
        target: "launcher"
        function toggle(): void {
            root.popupOpen = !root.popupOpen;
            if (root.popupOpen) {
                Qt.callLater(function() {
                    try {
                        if (popup && popup.searchField) {
                            popup.searchField.forceActiveFocus();
                        }
                    } catch (e) {
                        // safe no-op if popup or searchField not available
                    }
                });
            }
        }
    }

    Rectangle {
        id: launcherButton
        width: 40
        height: 40
        radius: 12
        anchors.centerIn: parent
        color: root.popupOpen ? "#ffffff18" : "#ffffff08"
        border.color: root.popupOpen ? "#ffffff28" : "#ffffff14"
        border.width: 1

        Behavior on color { ColorAnimation { duration: 140 } }
        Behavior on border.color { ColorAnimation { duration: 140 } }

        Text {
            id: label
            text: "⌘"
            color: "#f8fafc"
            font.pixelSize: 16
            font.weight: Font.Medium
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                root.popupOpen = !root.popupOpen;
                if (root.popupOpen) {
                    Qt.callLater(function() {
                        try {
                            if (popup && popup.searchField) {
                                popup.searchField.forceActiveFocus();
                            }
                        } catch (e) {
                            // ignore
                        }
                    });
                }
            }
        }
    }

    LazyLoader {
        id: popupLoader
        active: true
        PanelWindow {
            id: popup
            visible: root.popupOpen
            color: "transparent"
            implicitWidth: 620
            implicitHeight: 520
            focusable: true
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.namespace: "quickshell:launcher"
            exclusionMode: ExclusionMode.Ignore
            anchors { top: true }
            margins.top: panelWindow.height + 12
            margins.left: (panelWindow.width - implicitWidth) / 2
            onVisibleChanged: {
                if (visible) {
                    Qt.callLater(function() {
                        if (searchField) {
                            searchField.text = "";
                            root.searchText = "";
                            searchField.forceActiveFocus();
                        }
                    });
                }
            }

            Rectangle {
                id: popupBg
                anchors.fill: parent
                opacity: root.popupOpen ? 1 : 0
                color: "#f8fafc"
                radius: 24
                clip: true
                border.color: "#e5e7eb"
                border.width: 1

                Behavior on opacity { NumberAnimation { duration: 180; easing.type: Easing.OutCubic } }

                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#ffffff" }
                    GradientStop { position: 1.0; color: "#f2f5f8" }
                }

                Keys.onEscapePressed: root.closePopup()

                ColumnLayout {
                    anchors { fill: parent; margins: 0 }
                    spacing: 0

                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: 64
                        color: "transparent"

                        Rectangle {
                            anchors { fill: parent; margins: 14; bottomMargin: 8 }
                            radius: 16
                            color: searchField.activeFocus ? "#ffffff" : "#f7f8fa"
                            border.color: searchField.activeFocus ? "#cbd5e1" : "#e5e7eb"
                            border.width: 1

                            Behavior on border.color { ColorAnimation { duration: 180 } }
                            Behavior on color { ColorAnimation { duration: 180 } }

                            RowLayout {
                                anchors { fill: parent; leftMargin: 16; rightMargin: 16 }
                                spacing: 12

                                Text {
                                    text: "⌕"
                                    font.pixelSize: 18
                                    color: searchField.activeFocus ? "#4b5563" : "#94a3b8"
                                    font.weight: Font.Light
                                }

                                Rectangle {
                                    width: 1
                                    Layout.fillHeight: true
                                    color: "#e5e7eb"
                                }

                                TextInput {
                                    id: searchField
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    text: root.searchText
                                    color: "#0f172a"
                                    clip: true
                                    selectByMouse: true
                                    font.pixelSize: 16
                                    font.family: "Inter, SF Pro Display, Segoe UI, sans-serif"
                                    verticalAlignment: TextInput.AlignVCenter
                                    leftPadding: 0
                                    onTextChanged: root.searchText = text
                                    onEditingFinished: root.closePopup()

                                    Keys.onDownPressed: navigateNext()
                                    Keys.onUpPressed: navigatePrev()
                                    Keys.onReturnPressed: launchSelected()
                                    Keys.onEnterPressed: launchSelected()

                                    Text {
                                        anchors { left: parent.left; verticalCenter: parent.verticalCenter }
                                        text: "Search applications..."
                                        color: "#94a3b8"
                                        font: searchField.font
                                        visible: searchField.text.length === 0 && searchField.activeFocus
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.leftMargin: 20
                        Layout.rightMargin: 20
                        implicitHeight: 1
                        color: "#e5e7eb"
                    }

                    Item { Layout.fillWidth: true; implicitHeight: 10 }

                    ListView {
                        id: appList
                        model: DesktopEntries.applications.values
                        clip: true
                        boundsBehavior: Flickable.StopAtBounds
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.leftMargin: 4
                        Layout.rightMargin: 4
                        spacing: 2
                        currentIndex: 0
                        highlightMoveDuration: 120
                        snapMode: ListView.SnapToItem
                        keyNavigationEnabled: true

                        highlight: Rectangle {
                            color: "#f1f5f9"
                            radius: 14
                        }

                        Keys.onEscapePressed: root.closePopup()

                        delegate: Item {
                            id: delegateRoot
                            required property var modelData
                            required property int index
                            width: ListView.view.width
                            implicitHeight: matchesFilter ? 54 : 0
                            visible: matchesFilter

                            property bool matchesFilter: {
                                var query = root.searchText.toLowerCase();
                                if (query.length === 0) return true;
                                if (modelData.name && modelData.name.toLowerCase().indexOf(query) !== -1) return true;
                                if (modelData.genericName && modelData.genericName.toLowerCase().indexOf(query) !== -1) return true;
                                if (modelData.comment && modelData.comment.toLowerCase().indexOf(query) !== -1) return true;
                                return false;
                            }

                            Rectangle {
                                anchors { fill: parent; leftMargin: 10; rightMargin: 10 }
                                color: delegateRoot.ListView.isCurrentItem ? "#f8fafc" : ma.containsMouse ? "#f8fafc" : "transparent"
                                radius: 14

                                Behavior on color { ColorAnimation { duration: 120 } }

                                MouseArea {
                                    id: ma
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    cursorShape: Qt.PointingHandCursor
                                    onEntered: appList.currentIndex = delegateRoot.index
                                    onClicked: root.launchApp(modelData)
                                }

                                RowLayout {
                                    anchors { fill: parent; leftMargin: 16; rightMargin: 16 }
                                    spacing: 14

                                    Rectangle {
                                        implicitWidth: 40
                                        implicitHeight: 40
                                        radius: 12
                                        color: "#f1f5f9"

                                        Image {
                                            anchors.centerIn: parent
                                            source: Quickshell.iconPath(modelData.icon && modelData.icon.length > 0 ? modelData.icon : "application-x-executable")
                                            sourceSize.width: 28
                                            sourceSize.height: 28
                                        }
                                    }

                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        spacing: 2

                                        Text {
                                            Layout.fillWidth: true
                                            text: modelData.name || ""
                                            color: "#0f172a"
                                            font.pixelSize: 13
                                            font.weight: Font.Medium
                                            elide: Text.ElideRight
                                        }

                                        Text {
                                            Layout.fillWidth: true
                                            text: modelData.genericName || modelData.comment || ""
                                            color: "#64748b"
                                            font.pixelSize: 11
                                            elide: Text.ElideRight
                                            visible: text.length > 0
                                        }
                                    }

                                    Text {
                                        text: "↵"
                                        color: delegateRoot.ListView.isCurrentItem ? "#64748b" : "transparent"
                                        font.pixelSize: 16
                                        Layout.alignment: Qt.AlignVCenter
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        implicitHeight: visible ? 36 : 0
                        visible: root.searchText.length > 0
                        color: "transparent"

                        Text {
                            anchors.centerIn: parent
                            text: {
                                var query = root.searchText.toLowerCase();
                                var count = 0;
                                var apps = DesktopEntries.applications.values;
                                if (!apps) return "0 results";
                                for (var i = 0; i < apps.length; i++) {
                                    var app = apps[i];
                                    if (!app) continue;
                                    if (app.name && app.name.toLowerCase().indexOf(query) !== -1 ||
                                        (app.genericName && app.genericName.toLowerCase().indexOf(query) !== -1) ||
                                        (app.comment && app.comment.toLowerCase().indexOf(query) !== -1)) {
                                        count++;
                                    }
                                }
                                return count + " result" + (count !== 1 ? "s" : "");
                            }
                            color: "#94a3b8"
                            font.pixelSize: 11
                        }
                    }
                }
            }

            function navigateNext() {
                var next = appList.currentIndex + 1;
                while (next < appList.count) {
                    var item = appList.itemAtIndex(next);
                    if (item && item.visible) {
                        appList.currentIndex = next;
                        return;
                    }
                    next++;
                }
            }

            function navigatePrev() {
                var prev = appList.currentIndex - 1;
                while (prev >= 0) {
                    var item = appList.itemAtIndex(prev);
                    if (item && item.visible) {
                        appList.currentIndex = prev;
                        return;
                    }
                    prev--;
                }
            }

            function launchSelected() {
                if (appList.currentItem && appList.currentItem.visible) {
                    root.launchApp(appList.currentItem.modelData);
                }
            }
        }
    }
}
