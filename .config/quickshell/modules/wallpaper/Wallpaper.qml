import QtQuick
import Quickshell
import Quickshell.Wayland
import QtQuick.Effects

Scope {
    id: root
    property string wallpaperSource: "file:///home/percy/.dotfiles/.wall/002.jpg"
    property bool blurEnabled: true
    property real blurAmount: 0.9
    property real blurMax: 60
    property real contrast: 0.6

    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: win
            required property var modelData
            screen: modelData
            anchors {
                top: true
                left: true
                right: true
                bottom: true
            }
            WlrLayershell.layer: WlrLayer.Bottom
            color: "transparent"
            surfaceFormat.opaque: false

            Item {
                id: wallpaperLayer
                anchors.fill: parent
                Image {
                    id: bg
                    source: root.wallpaperSource
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    asynchronous: true
                }
                MultiEffect {
                    source: bg
                    anchors.fill: parent
                    blurEnabled: root.blurEnabled
                    blur: root.blurAmount
                    blurMax: root.blurMax
                    contrast: root.contrast
                    autoPaddingEnabled: false
                }
                Component.onCompleted: {
                    // Try to load configuration from assets/Config.qml if available
                    var comp = Qt.createComponent("assets/Config.qml");
                    if (comp.status === Component.Ready) {
                        var conf = comp.createObject(null);
                        if (conf && conf.wallpaperSource !== undefined && conf.wallpaperSource !== "") {
                            // prefer explicit file:// URL if provided by config
                            root.wallpaperSource = conf.wallpaperSource.indexOf("file://") === 0 ? conf.wallpaperSource : (conf.wallpaperSource);
                        }
                        if (conf) conf.destroy();
                    }
                }
            }
        }
    }
}
