pragma Singleton

import QtQuick

Item {
    id: config

    // Theme
    property string bg: "#0a0a0a"
    property string bgDark: "#1e1e1e"
    property string bgLight: "#2a2a2a"
    property string fg: "#EEEFFF"
    property string textLight: "#ffffff"
    property string textSub: "#888888"
    property string textMuted: "#666666"
    property string borderColor: "#33ffffff"
    property string borderFocus: "#7aa2f7"
    property string accentLine: "#55ffffff"
    property string surface: "#e61e1e1e"
    property string surfaceCard: "#ee1e1e1e"
    property string highlight: "#28ffffff"
    property string highlightHover: "#14ffffff"
    property string colorCyan: "#0db9d7"
    property string colorRed: "#f7768e"
    property string colorYellow: "#e0af68"
    property string colorBlue: "#7aa2f7"

    // Bar
    property string barFontFamily: "ComicShannsMono Nerd Font"
    property int barFontSize: 20
    property int barHeight: 32

    // Wallpaper
    property string wallpaperSource: "file:///home/percy/.dotfiles/.wall/002.jpg"

    // Notifications
    property int notifyTimeout: 5000

    // Popup
    property int popBorder: 1
    property int border: 10

    property bool ready: false
}
