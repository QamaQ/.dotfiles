pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

Scope {
    id: bar
    property int barHeight: 38
    property bool barVisible: true

    IpcHandler {
        target: "bar"
        function toggle(): void {
            bar.barVisible = !bar.barVisible;
        }
    }

    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: barRoot
            required property var modelData
            screen: modelData
            visible: bar.barVisible
            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.namespace: "quickshell:bar"
            surfaceFormat.opaque: false
            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: bar.barHeight
            color: "#0A0A0A"
            exclusionMode: bar.barVisible ? ExclusionMode.Auto : ExclusionMode.Ignore
            exclusiveZone: bar.barVisible ? bar.barHeight : 0
            focusable: true

            BackgroundEffect.blurRegion: Region {
                item: barRoot.contentItem
            }
            BarItems { panelWindow: barRoot }
        }
    }
}
