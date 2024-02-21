#!/bin/sh
# shellcheck disable=SC2155

# export basics
export VISUAL="vim"
export EDITOR="$VISUAL"
export PAGER="less"
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
if [ -z "$XDG_RUNTIME_DIR" ]; then
	XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"

	mkdir -pm 0700 "$XDG_RUNTIME_DIR"
	export XDG_RUNTIME_DIR
fi

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
export NVM_DIR="$XDG_DATA_HOME/nvm"

# commonlisp
export ROSWELL_HOME="$XDG_DATA_HOME/roswell"
export PATH="$PATH:$ROSWELL_HOME/bin"

# misc
export LESS="R"
export HISTFILE="$XDG_DATA_HOME/history"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export FZF_DEFAULT_OPTS="--height 50%"
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export DCRC="$XDG_CONFIG_HOME/dc/dcrc"
export BAT_THEME="everforest"

# email
export MAILDIR="$XDG_DATA_HOME/mail"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/default/notmuch-config"
export NOTMUCH_DATABASE="$XDG_DATA_HOME/mail"
export MBSYNCRC="$XDG_CONFIG_HOME/isync/mbsyncrc"

# gpodder
export GPODDER_HOME="$XDG_CONFIG_HOME/gpodder"
export GPODDER_DOWNLOAD_HOME="$XDG_DATA_HOME/gpodder"

# gpg stuff
export GPG_TTY="$(tty)"
export KEYID=0x099F4FAFE6D2E988
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# pass stuff
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PASSWORD_STORE_GENERATED_LENGTH=20
export PASSWORD_STORE_CHARACTER_SET="[:alnum:]!@#$%^&*"
