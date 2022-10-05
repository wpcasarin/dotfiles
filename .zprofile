#!/bin/bash

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
export XAUTHORITY="/tmp/.Xauthority"
