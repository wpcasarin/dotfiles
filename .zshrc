if [[ ! -d ~/.oh-my-zsh ]]; then
  KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias reboot="loginctl reboot"
alias poweroff="loginctl poweroff"
alias down="bdpandl -n 300"
alias vinit="yarn create vite"
alias ls="exa --icons --group-directories-first"
alias cat="bat --style=auto"
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

xdg_dirs='
XDG_DESKTOP_DIR="$HOME/desk"
XDG_DOWNLOAD_DIR="$HOME/dwns"
XDG_TEMPLATES_DIR="$HOME/"
XDG_PUBLICSHARE_DIR="$HOME/"
XDG_DOCUMENTS_DIR="$HOME/docs"
XDG_MUSIC_DIR="$HOME/music"
XDG_PICTURES_DIR="$HOME/pics"
XDG_VIDEOS_DIR="$HOME/vids"'

update_xdg_dirs() {
  TO_REMOVE=(Desktop Documents Downloads Music Pictures Videos Public Templates)
  TO_CREATE=(desk docs dwns music pics vids .config)

  cd ~

  for dir in $TO_REMOVE; do
    if [[ -d ~/$dir ]]; then
      rmdir ~/$dir
      echo "$dir removed."
    fi
  done

  for dir in $TO_CREATE; do
    if [[ ! -d ~/$dir ]]; then
      mkdir ~/$dir
      echo "$dir created."
    fi
  done

  echo $xdg_dirs >~/.config/user-dirs.dirs
  xdg-user-dirs-update
}

if [[ ! -f ~/.config/user-dirs.dirs ]]; then
  update_xdg_dirs
  echo "User dirs updated!"
fi
