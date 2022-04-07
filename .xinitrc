#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

pipewire &
pipewire-pulse &
wireplumber &

xrandr --output HDMI-1 --mode 1920x1080 --rate 144
setxkbmap br
$HOME/.fehbg
picom -b
# Statusbar
#$HOME/code/dwm-bar/dwm_bar.sh &

if pidof ssh-agent >/dev/null; then
    echo "ssh-agent already running."
else
    eval $(ssh-agent -s)
fi

if pidof gnome-keyring-daemon >/dev/null; then
    echo "gnome-keyring-daemon already running."
else
    eval $(gnome-keyring-daemon --start)
fi
export SSH_AUTH_SOCK

exec dbus-launch --sh-syntax --exit-with-session qtile start
