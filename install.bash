#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir="`pwd`/configs"   # config files directory
olddir=~/dotfiles_old # old dotfiles backup directory
files=(common_profile.bash vimrc osx.bash)
##########

# create dotfiles_old in homedir
[ -d $olddir ] && rm -rf $olddir
mkdir $olddir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in "${files[@]}"; do
  mv ~/.$file $olddir
  ln -s $dir/$file ~/.$file
done
echo 'symlinks done'

cd
# add common profile to bash profile or bashrc then source it
for file in '.bash_profile' '.bashrc'; do
	if [ -f $file ]; then
		[[ -z  $(grep ${files[0]} $file) ]] && echo "source .${files[0]}" >> $file
		source $file
	fi
done

# change to install directory
cd $dir
cd ..

# one time configs
email='frankieteardrop%gmail.com'
git config --global user.name "Lihan Li"
git config --global user.email ${email/\%/@}
git config --global core.excludesfile $dir/gitignore_global

[[ $OSTYPE =~ ^darwin.*$ ]] && ./osx_install.bash