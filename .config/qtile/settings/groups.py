# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile workspaces

from libqtile.config import Key, Group
from libqtile.command import lazy
from libqtile.lazy import lazy
from .keys import mod, keys, mod1


# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons: 
# nf-fa-firefox, 
# nf-fae-python, 
# nf-dev-terminal, 
# nf-fa-code, 
# nf-oct-git_merge, 
# nf-linux-docker,
# nf-mdi-image, 
# nf-mdi-layers

groups = [
    Group("1", label='󰧞'),
    Group("2", label='󰧞'),
    Group("3", label='󰧞'),
    Group("4", label='󰧞'),
    Group("5", label='󰧞'),
    Group("6", label='󰧞'),

]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=False),
            desc="Switch to & move focused window to group {}".format(i.name)),
        Key([mod1, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        #Key([mod], "[", lazy.screen.prev_group(skip_empty=False)), # cycle left
        #Key([mod], "]", lazy.screen.next_group(skip_empty=False)), #cycle right
    ])