import Quickshell
import QtQuick
import Quickshell.Wayland
import QtQuick.Effects

Scope {
    id: root
    property string wallpaperSource: "/home/percy/.dotfiles/.wall/002.jpg"
    property bool blurEnabled: true
    property real blurAmount: 0.9
    property real blurMax: 60
    property real contrast: 0.6

    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: win
            anchors {
                top: true
                left: true
                right: true
                bottom: true
            }
            required property var modelData
            screen: modelData
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
                    anchors.fill: bg
                    blurEnabled: root.blurEnabled
                    blur: root.blurAmount
                    blurMax: root.blurMax
                    contrast: root.contrast
                    autoPaddingEnabled: false
                }
            }
        }
    }
}
