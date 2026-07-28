//@ pragma UseQApplication
import Quickshell

import "modules/wallpaper"
import "modules/bar"
import "modules/launcher"
import "widgets"

Scope {
    id: root
    Wallpaper {
        PopupWindow {
            anchor.window: toplevel
            anchor.rect.x: parentWindow.width / 2 - width / 2
            anchor.rect.y: parentWindow.height
            width: 500
            height: 500
            visible: true
        }
    }
    // Bar {}
}
