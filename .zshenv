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
export MYSQL_PS1="\R:\m:\s (\u@\h) [\d]> "
export PAGER="less"

export PERL5LIB="local/lib/perl5"

# The .NET Core tools collect usage data in order to help us improve your
# experience. The data is anonymous and doesn't include command-line arguments.
# The data is collected by Microsoft and shared with the community. You can
# opt-out of telemetry by setting the DOTNET_CLI_TELEMETRY_OPTOUT environment
# variable to '1' or 'true' using your favorite shell.
export DOTNET_CLI_TELEMETRY_OPTOUT=1

if [ -e /usr/share/source-highlight/src-hilite-lesspipe.sh ]; then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
else
    echo "source-highlight not installed"
fi
