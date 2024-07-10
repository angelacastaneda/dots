#!/bin/sh

source "$HOME/.config/shell/profile"

# what no user services does to someone :/
pidof pipewire &>/dev/null || /usr/libexec/pipewire-launcher &> /tmp/pipewire.out &
pidof mpd &>/dev/null || mpd
pidof syncthing &>/dev/null || syncthing &> /tmp/syncthing.out &

cp ~/.editorconfig /tmp

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
