from libqtile import widget
from .theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-2
    )


def workspaces(): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='JetBrainsMono Nerd Font',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=True,
            highlight_method='text',
            urgent_alert_method='text',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
        separator(),
    ]

def wallpaper():
    return widget.Wallpaper(
        background = colors['dark'],
        directory = '~/.dotfiles/.wall/',
        fmt = '',
        padding = 5,
        random_selection = True,

    )


primary_widgets = [
    wallpaper(),

    separator(),

    *workspaces(),

    separator(),

    powerline('dark', 'dark'),

    icon(fg="color4", text=' '), # Icon: nf-fa-download


    widget.CheckUpdates(
        background=colors['dark'],
        colour_have_updates=colors['color4'],
        colour_no_updates=colors['color4'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        custom_command='checkupdates',
    ),

    powerline('dark', 'dark'),

    icon(bg="dark",fg="color3", text=' '),  # Icon: nf-fa-feed
    
    widget.Net(**base(bg='dark', fg='color3'), interface='wlp3s0'),

    powerline('dark', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='dark', fg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='dark', fg='color2'), padding=5),

    powerline('dark', 'dark'),

    icon(bg="dark", fg='color1', fontsize=17, text=' '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(bg='dark', fg='color1'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'dark'),

    widget.Systray(background=colors['dark'], padding=5),
]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('color1', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),

    widget.CurrentLayout(**base(bg='color1'), padding=5),

    powerline('color2', 'color1'),

    widget.Clock(**base(bg='color2'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color2'),
]

widget_defaults = {
    'font': 'JetBrainsMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
