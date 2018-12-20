# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

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

# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt adam1

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

alias e="$EDITOR"
alias less="less -I"
alias ls="ls --color=auto -F"
alias ll="ls -l"
alias la='ls -a'
alias lth='ls -lt | head'
alias xml='xml_pp'

alias r='bundle exec rspec -rspec_helper'

if [ -x ~/.otb/otb.sh ]; then
    source $HOME/.otb/otb.sh
fi

psg() {
  if [ "$*" != "" ]; then
    ps auxwww | grep $* | grep -v grep
  fi
}

bundle-grep() {
  grep -r "$@" `bundle show --paths`
}

#function git-bhist(){
#    for k in `git branch | cut -b3-`; do
#        echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;
#    done | sort -r
#}

# https://github.otbeach.com/gist/radek-molenda/673
git_root_dir() { echo $(git rev-parse --show-toplevel); }

otb_app_name() { echo "$1" | sed 's/\/current//' | sed 's/\/.*\/\(.*\)/\1/'; }

otb_current_app() { otb_app_name $(git_root_dir); }

current_branch() { git branch | grep '*' | cut -b3-; }

otb_comparision_url() { echo "https://github.otbeach.com/onthebeach/$(otb_current_app)/compare/${1-master}...search-team:${2-$(current_branch)}"; }

#it $WEB_BROWSER is not set it defaults to firefox
otb_compare() { sensible-browser $(otb_comparision_url $1); }

remote_branches() { for x in $(git remote); do git branch -r | sed -e"s/.*$x\///"; done | sort | uniq; return 0; }

_remote_branches_complete_() {
  reply=( $(remote_branches) )
}

stupid_spec() {
  be spec `find spec -name '*_spec.rb' | sort`
}

compctl -K _remote_branches_complete_ otb_compare

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
