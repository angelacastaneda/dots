# git prompt
autoload -Uz vcs_info
precmd() {
  vcs_info
}
setopt PROMPT_SUBST

autoload -U colors && colors
zstyle ':vcs_info:git:*' formats '%F{green}%b%f '

PS1='%F{red}%n%f@%F{blue}%m%f:%~ ${vcs_info_msg_0_}$ '

# vim mode
bindkey -v
export KEYTIMEOUT=1

setopt autocd # cd into dirs said
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments # let echo sup #comment work

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000

source "$XDG_CONFIG_HOME/shell/aliasrc"

lfcd() {
	# command given in case lf aliases to lfcd
	cd "$(command lf -print-last-dir "$@")"
}

bindkey -s '^o' '^ulfcd\n'

fzfcd() {
	cd "$(dirname "$(find . -mindepth 1 -not -path '*/\.git/*' | fzf)")"
}

bindkey -s '^f' '^ufzfcd\n'

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source syntax highlighting at end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
