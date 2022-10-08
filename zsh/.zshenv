#!/bin/bash

source "/opt/asdf-vm/asdf.sh"
source "$HOME/.cargo/env"


if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  export MOZ_ENABLE_WAYLAND=1
fi

export EDITOR="nvim"
export ELECTRON_TRASH="trash-cli"
export XDG_CONFIG_HOME="$HOME/.config"
export NPM_CONFIG_PREFIX="$HOME/.local"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd"
export ANDROID_SDK_ROOT="$HOME/.sdk"

PATH=$PATH:$ANDROID_SDK_ROOT/emulator
PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
PATH="$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH"
