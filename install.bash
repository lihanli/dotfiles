#!/bin/bash
dotfiles_dir=~/dotfiles
source $dotfiles_dir/functions/util.bash

configs_dir=$dotfiles_dir/configs
olddir=~/dotfiles_old

# create dotfiles_old in homedir
[[ -d $olddir ]] && rm -rf $olddir
mkdir $olddir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in "$dotfiles_dir"/dotfiles/*; do
  file=`basename "$file"`
  new_file=~/.$file

  [[ -f $new_file ]] && mv $new_file $olddir
  ln -s "$dotfiles_dir"/dotfiles/$file $new_file
done

# clone antigen if it doesnt exist
if [[ ! -d ~/antigen ]]; then
  git clone https://github.com/zsh-users/antigen.git ~/antigen
  cd ~/antigen
  git checkout 74aa89757038e42d472db22cb5b5bc6cbd4edb93
fi

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
