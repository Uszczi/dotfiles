import os
import subprocess
from typing import List  # noqa: F401

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from text import str_formater_with_const_width

HOME = os.path.expanduser("~")

mod = "mod4"
terminal = f"{HOME}/dotfiles/scripts/run-terminal.sh"

# default_browser = "firefox -p"
default_browser = "google-chrome"

keys = [
    # Layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Position
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    # Size
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod], "n", lazy.layout.normalize()),
    # Qtile
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    ####
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "b", lazy.hide_show_bar("bottom"), desc="Toggle menu bar."),
    # Apps
    Key([mod], "b", lazy.spawn(default_browser)),
    Key([mod], "i", lazy.spawn("guake")),
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "r", lazy.spawn("dmenu_run")),
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui")),
    # Monitors
    Key([mod], "comma", lazy.prev_screen(), desc="Move focus to prev monitor"),
    Key([mod], "period", lazy.next_screen(), desc="Move focus to next monitor"),
    # Media buttons
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -D pulse sset Master '5%-'")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play")),
    Key([], "XF86AudioPause", lazy.spawn("playerctl pause")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl pause")),
    Key([mod], "e", lazy.spawn("notify-send -t 1000 '$(playerctl volume)'")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -D pulse sset Master '5%+'")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
]


class MyGroup(Group):
    def __init__(self, name: str, key: str, **kwargs):
        super().__init__(name, **kwargs)
        self.key = key


groups = [
    MyGroup(
        name="1",
        key="1",
        matches=[],
    ),
    MyGroup(name="2", key="2"),
    MyGroup(name="3", key="3"),
    MyGroup(name="4", key="4"),
    MyGroup(name="5", key="5", matches=[Match(wm_class=["spotify", "Spotify"])]),
    MyGroup(name="6", key="6"),
    MyGroup(name="7", key="7"),
    MyGroup(
        name="8",
        key="8",
        matches=[Match(wm_class=["obsidian", "obsidian"])],
    ),
    MyGroup(
        name="9",
        key="9",
        matches=[Match(wm_class=["todoist", "Todoist"])],
    ),
]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.key,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.key,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

layout_theme = {
    "border_width": 2,
    "margin": 10,
    "border_focus": "e1acff",
    "border_normal": "1D2330",
    "single_border_width": 0,
}

layouts = [
    layout.MonadTall(**layout_theme),  # type: ignore
    layout.Max(
        **{
            "border_focus": "e1acff",
            "border_normal": "1D2330",
        }
    ),  # type: ignore
    layout.Columns(**layout_theme),  # type: ignore
    layout.RatioTile(**layout_theme),  # type: ignore
    layout.Floating(**layout_theme),  # type: ignore
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),  # type: ignore
                widget.GroupBox(),  # type: ignore
                widget.WindowName(),  # type: ignore
                # Multi window Systray doesn't work
                widget.Systray(),  # type: ignore
                widget.Clock(format="%Y-%m-%d %a %H:%M"),  # type: ignore
                # widget.Battery(),  # type: ignore
                widget.QuickExit(),  # type: ignore
                # widget.CPUGraph(),
                # widget.Memory(),
            ],
            24,
        ),
    ),
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(fmt=str_formater_with_const_width()),  # type: ignore
                widget.GroupBox(),  # type: ignore
                widget.WindowName(),  # type: ignore
                # widget.Systray(),  # type: ignore
                widget.Clock(format="%Y-%m-%d %a %H:%M"),  # type: ignore
                # widget.Battery(),  # type: ignore
                widget.QuickExit(),  # type: ignore
            ],
            24,
        ),
    ),
]

mouse = [
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(  # type: ignore
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,  # type: ignore
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="Tip of the day "),  # DBeaver
        Match(wm_class="DBeaver"),  # DBeaver
        Match(wm_class="guake"),
        Match(wm_class="1password"),
    ]
)
auto_fullscreen = False
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# Just from default config file.
wmname = "LG3D"


@hook.subscribe.startup_once
def start_once():
    processes = [
        [HOME + "/.config/qtile/autostart.sh"],
        ["obsidian"],
        ["todoist"],
    ]

    for process in processes:
        subprocess.Popen(process)
