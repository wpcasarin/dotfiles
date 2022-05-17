#!/bin/sh

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
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CURRENT_DESKTOP=sway
export XAUTHORITY="/tmp/.Xauthority"
export MOZ_ENABLE_WAYLAND=1
export NPM_CONFIG_PREFIX="$HOME/.local"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"
export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk
export IDEA_JDK=/usr/lib/jvm/java-11-openjdk
export DATAGRIP_JDK=/usr/lib/jvm/java-11-openjdk
export ANDROID_SDK_ROOT=$HOME/data/android/sdk
export CAPACITOR_ANDROID_STUDIO_PATH=/opt/android-studio/bin/studio.sh 
export ELECTRON_TRASH=trash-cli

[ "$(tty)" = "/dev/tty1" ] && exec dbus-launch --sh-syntax --exit-with-session sway
