#!/bin/bash

REQUIRED_BINARIES=(
  git
  dirname
  realpath
  readlink
)

DOTFILES=(
  antigen
  .config/terminator
  .git_commit_message
  .gitconfig
  .gitignore
  .gitmodules
  .irbrc
  .perlcriticrc
  .rubocop.yml
  .vim
  .vimrc
  .zlogin
  .zprofile
  .zshenv
  .zshrc
)

DOTFILE_DIR=`dirname $0`

function main {
  sanity_check
  update_submodules
  create_symlinks
  echo "Dotfile installation is complete"
}

function sanity_check {
  for REQUIRED_BINARY in ${REQUIRED_BINARIES[*]}; do
    if ! which $REQUIRED_BINARY > /dev/null; then
      echo "Unable to find required $REQUIRED_BINARY command"
      exit 1
    fi
  done
}

function update_submodules {
  echo "Installing git submodules..."
  git -C $DOTFILE_DIR submodule update --init --quiet
}

function create_symlinks() {
  echo "Installing symlinks..."

  for DOTFILE in ${DOTFILES[*]}; do
    TARGET=$HOME/$DOTFILE
    SOURCE=`realpath $DOTFILE_DIR/$DOTFILE`

    if [ ! -e "$SOURCE" ]; then
      echo "Unable to find source dotfile $SOURCE"
      exit 1
    fi

    if [ -h $TARGET ]; then
      if [ "`readlink $TARGET`" = "$SOURCE" ]; then
        #echo "Correct symlink has already been created for $TARGET"
        continue
      fi
    fi

    if [ -e $TARGET -o -h $TARGET ]; then
      echo -e "\n$TARGET exists, but isn't the expected symlink to $SOURCE."
      echo "Let's see if you want to remove it"

      rm -i -r $TARGET
      if [ -e $TARGET ]; then
        echo "$TARGET still exists. Failing."
        exit 1
      fi
    fi

    mkdir -p `dirname $TARGET`
    ln -s $SOURCE $TARGET
    if [ $? = 1 ]; then
      echo "Problem creating symlink"
      exit 1
    fi
  done
}

main
exit 0
