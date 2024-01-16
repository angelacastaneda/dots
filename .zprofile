#!/bin/sh
# shellcheck disable=SC2155

# export basics
export VISUAL="vim"
export EDITOR="$VISUAL"
export BROWSER="firefox"
export TERMINAL="foot" # add check for st in x11

# recursively add dirs in .local/bin to PATH
export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ":" -)"

# anything in ~/bin supercedes path items
export PATH="$HOME/bin:$PATH"

# xdg defs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# go stuff
export GOPROXY=direct
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PATH="$PATH:$GOBIN"

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$PATH:$CARGO_HOME/bin"

# node
export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# misc
export HISTFILE="$XDG_DATA_HOME/history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export FZF_DEFAULT_OPTS="--height 50%"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuch-config"

# gpodder
export GPODDER_HOME="$XDG_CONFIG_HOME/gpodder"
export GPODDER_DOWNLOAD_HOME="$XDG_DATA_HOME/gpodder"

# gpg stuff
export GPG_TTY="$(tty)"
export KEYID=0x099F4FAFE6D2E988

# pass stuff
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PASSWORD_STORE_GENERATED_LENGTH=20
export PASSWORD_STORE_CHARACTER_SET="[:alnum:]!@#$%^&*"

# fake hacks
export MBSYNCRC="$XDG_CONFIG_HOME/mbsync/mbsyncrc"
export DCRC="$XDG_CONFIG_HOME/dc/dcrc"
