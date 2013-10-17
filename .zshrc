# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library (used for themes mostly)
antigen use oh-my-zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme gentoo

# Tell antigen that you're done.
antigen apply

# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups
#sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias e="$EDITOR"
alias less="less -I"
alias ls="ls --color=auto -F"
alias ll="ls -l"
alias la='ls -a'
alias xml='xml_pp'

alias be='bundle exec'
alias bi='bundle install'

alias ggpull='git fetch && git pull origin master'
alias gb='git branch'
alias gba='git branch -a'
alias gs='git status'
alias gl='git log'
alias gd='git diff'

if [ -x ~/.otb/otb.sh ]; then
    source $HOME/.otb/otb.sh
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

psg() {
  if [ "$*" != "" ]; then
    ps auxwww | grep $* | grep -v grep
  fi
}

#function git-bhist(){
#    for k in `git branch | cut -b3-`; do
#        echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;
#    done | sort -r
#}
