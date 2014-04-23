#!/bin/bash
dotfiles_dir=~/dotfiles
source $dotfiles_dir/functions/util.bash

configs_dir=$dotfiles_dir/configs
olddir=~/dotfiles_old

# create dotfiles_old in homedir
[ -d $olddir ] && rm -rf $olddir
mkdir $olddir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in "$dotfiles_dir"/dotfiles/*; do
  file=`basename "$file"`

  mv ~/.$file $olddir
  ln -s "$dotfiles_dir"/dotfiles/$file ~/.$file
done

# one time configs
email='frankieteardrop%gmail.com'
git config --global user.name 'Lihan Li'
git config --global user.email ${email/\%/@}
git config --global core.excludesfile $configs_dir/gitignore_global
git config --global core.autocrlf input
git config color.diff auto --global
git config color.status auto --global

dotfiles_install_dir=$dotfiles_dir/install
case `os_detect` in
  osx) source $dotfiles_install_dir/osx.bash;;
  ubuntu-desktop) source $dotfiles_install_dir/linux_desktop.bash;;
esac

echo 'install complete'
