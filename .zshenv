# This file is sourced on all invocations of the shell.
# If the -f flag is present or if the NO_RCS option is
# set within this file, all other initialization files
# are skipped.
#
# This file should contain commands to set the command
# search path, plus other important environment variables.
# This file should not contain commands that produce
# output or assume the shell is attached to a tty.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

umask 002
ulimit -c unlimited

export CONSOLEBROWSER="/usr/bin/links"
export EDITOR="vim"
export LESS=' -R '
export MAKEFLAGS=-j`grep -c ^processor /proc/cpuinfo`
export MYSQL_PS1="(\u@\h) [\d]> "
export PAGER="less"

# Ruby GC settings for faster spec suite runs.
# From https://github.otbeach.com/gist/matthew-house/696
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

export PERLLIB="$HOME/perl5/lib/perl5"

if [ -e /usr/share/source-highlight/src-hilite-lesspipe.sh ]; then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
else
    echo "source-highlight not installed"
fi

export PATH="$PATH:$HOME/bin:/sbin:/usr/sbin:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

