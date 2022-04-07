#!/bin/sh

#kill gnome-keyring-daemon
#pkill ssh-agent
#eval $(ssh-agent -s)
#eval $(gnome-keyring-daemon --start)

#export SSH_AUTH_SOCK
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
#export XDG_CURRENT_DESKTOP=sway
export XAUTHORITY="/tmp/.Xauthority"
#export MOZ_ENABLE_WAYLAND=1
export NPM_CONFIG_PREFIX="$HOME/.local"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk
#export IDEA_JDK=/usr/lib/jvm/java-11-openjdk
#export DATAGRIP_JDK=/usr/lib/jvm/java-11-openjdk
export ELECTRON_TRASH=trash-cli
export LADSPA_PATH="libdir/ladspa:/usr/local/lib/ladspa:/usr/lib/ladspa"
[ "$(tty)" = "/dev/tty1" ] && exec startx
