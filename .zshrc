# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

#==============================================================================
echo "Antigen..."

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library (used for themes mostly)
antigen use oh-my-zsh
unsetopt auto_name_dirs

antigen bundle git
antigen bundle bundler

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme gentoo

# Tell antigen that you're done.
antigen apply

setopt histignorealldups
setopt no_share_history
unsetopt correct_all

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# ZSH: Don't overwrite window titles
DISABLE_AUTO_TITLE=true

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

#==============================================================================
echo "RVM..."

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#==============================================================================
echo "NVM..."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#==============================================================================
echo "OTB Aliases..."

if [ -x $HOME/bin/otb-shell-aliases.sh ]; then
  source $HOME/bin/otb-shell-aliases.sh
fi

#==============================================================================
clear

alias e="$EDITOR"
alias less="less -I"
alias ls="ls --color=auto -F"
alias ll="ls -l"
alias la='ls -a'
alias lth='ls -lt | head'
alias xml='xml_pp'

alias r='bundle exec rspec -rspec_helper'

psg() {
  if [ "$*" != "" ]; then
    ps auxwww | grep $* | grep -v grep
  fi
}

if [[ -e $HOME/bin/motivator.pl ]]; then
  $HOME/bin/motivator.pl
fi
