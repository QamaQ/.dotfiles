from libqtile import hook
from settings.keys import mod, keys
from settings.groups import groups
from settings.layouts import layouts, floating_layout
from settings.widgets import widget_defaults, extension_defaults
from settings.screens import screens
from settings.mouse import mouse
from settings.path import qtile_path

from os import path
import subprocess

# @hook.subscribe.startup_once
# def autostart():
#     subprocess.call([path.join(qtile_path, 'autostart.sh')])
#


def is_running(process):
    """check if a process is already running (used in run_once).
    TODO: can be removed
    """
    s = subprocess.Popen(["ps", "axuw"], stdout=subprocess.PIPE)
    for x in s.stdout:
        if re.search(process, x.decode("utf-8")):
            return True
    return False


def execute_once(process):
    """run a process once.
    TODO: can be removed
    """
    if not is_running(process):
        return subprocess.Popen(process.split())


def execute(process):
    """run a process."""
    return subprocess.Popen(process.split())


@hook.subscribe.startup_once
def startup_once():
    """Start the applications at Qtile startup."""
    # detect_screens(qtile)
    # execute("nm-applet"),
    # execute("volumeicon"),
    execute("picom"),
    # execute("cbatticon -u 2"),
    execute("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")


@hook.subscribe.startup_complete
def startup_complete(qtile=None):
    # loop = asyncio.get_event_loop()
    # logger.info("Startup complete: qtile:%s, loop:%s", qtile, loop)
    # here the loop is not yet started
    # loop.call_later(5, auto_wallpaper, loop)

    # old thread method:
    # from threading import Thread
    # Thread(target=auto_wallpaper).start()
    pass


main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "urgent"
wmname = "LG3D"
