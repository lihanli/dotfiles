#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=(common_profile.bash vimrc osx.bash)
##########

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in "${files[@]}"; do
  mv ~/.$file ~/dotfiles_old/
  ln -s $dir/$file ~/.$file
done
echo 'symlinks done'

cd $HOME
# add common profile to bash profile or bashrc then source it
for file in '.bash_profile' '.bashrc'; do
	if [ -f $file ]; then
		[[ -z  $(grep ${files[0]} $file) ]] && echo "source .${files[0]}" >> $file
		source $file
	fi
done

# one time configs
email='frankieteardrop%gmail.com'
git config --global user.name "Lihan Li"
git config --global user.email ${email/\%/@}
