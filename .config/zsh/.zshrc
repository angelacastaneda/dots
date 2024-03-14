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

alias zshrc="$EDITOR ${ZDOTDIR:-${HOME}}/.zshrc && source ${ZDOTDIR:-${HOME}}/.zshrc"
alias rm="rm -i"
alias cal="cal -m"
alias ping="ping -c 3"
[ -x "$(command -v doas)" ] && alias sudo='doas'

# source "$XDG_CONFIG_HOME/shell/aliasrc"  TODO migrate aliases away from here
source "$XDG_CONFIG_HOME/shell/bookmarks"

# color
alias ls="ls --color=auto"
alias tree="tree -C"
alias grep="grep --color=auto"

# mailsync stuff
[ -f "$MBSYNCRC" ] && alias mbsync="mbsync -c $MBSYNCRC"

# calculators
alias bc="bc -q"
[ -f "$DCRC" ] && alias dc="dc -f $DCRC -"

lfcd() {
	# command given in case lf aliases to lfcd
	cd "$(command lf -print-last-dir "$@")"
}

bindkey -s '^o' '^ulfcd\n'

fzfcd() {
	# command given in case lf aliases to lfcd
	cd "$(dirname "$(find . -mindepth 1 -not -path '*/\.git/*' | fzf)")"
}

bindkey -s '^f' '^ufzfcd\n'

# abook
alias abook="abook --config '$XDG_CONFIG_HOME/abook/abookrc' --datafile '$XDG_DATA_HOME/abook/addressbook'"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# source syntax highlighting at end
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
