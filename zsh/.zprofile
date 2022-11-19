#!/bin/bash

if pidof gnome-keyring-daemon >/dev/null; then
    echo "starting gnome-keyring-daemon"
    killall "gnome-keyring-daemon"
    eval $(gnome-keyring-daemon --start --components=secrets,ssh)
else
    eval $(gnome-keyring-daemon --start --components=secrets,ssh)
fi

export SSH_AUTH_SOCK=/run/user/$(id -u)/keyring/ssh
export XAUTHORITY=/tmp/.Xauthority
