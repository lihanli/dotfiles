#!/bin/bash

dotfiles_dir=~/dotfiles
source $dotfiles_dir/functions/util.bash
# config files directory
configs_dir=$dotfiles_dir/configs
# old dotfiles backup directory
olddir=~/dotfiles_old
# common_profile.bash needs to always be first because it's referenced later
files=(common_profile.bash vimrc gemrc inputrc)

# create dotfiles_old in homedir
[ -d $olddir ] && rm -rf $olddir
mkdir $olddir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in "${files[@]}"; do
  mv ~/.$file $olddir
  ln -s $configs_dir/$file ~/.$file
done

# add common profile to bash profile or bashrc then source it
for file in '.bash_profile' '.bashrc'; do
  file=~/$file
  if [ -f $file ]; then
    [[ -z $(grep ${files[0]} $file) ]] && echo "source ~/.${files[0]}" >> $file
    source $file
  fi
done

# one time configs
email='frankieteardrop%gmail.com'
git config --global user.name 'Lihan Li'
git config --global user.email ${email/\%/@}
git config --global core.excludesfile $configs_dir/gitignore_global
git config --global core.autocrlf input

dotfiles_install_dir=$dotfiles_dir/install
case `os_detect` in
  osx) source $dotfiles_install_dir/osx.bash;;
  ubuntu-desktop) source $dotfiles_install_dir/linux_desktop.bash;;
esac

echo 'install complete'