#!/bin/bash

# config files directory
dir="`pwd`/configs"
# old dotfiles backup directory
olddir=~/dotfiles_old
files=(common_profile.bash vimrc osx.bash)

# create dotfiles_old in homedir
[ -d $olddir ] && rm -rf $olddir
mkdir $olddir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in "${files[@]}"; do
  mv ~/.$file $olddir
  ln -s $dir/$file ~/.$file
done

# add common profile to bash profile or bashrc then source it
for file in '.bash_profile' '.bashrc'; do
	file=~/$file
	if [ -f $file ]; then
		[[ -z  $(grep ${files[0]} $file) ]] && echo "source ~/.${files[0]}" >> $file
		source $file
	fi
done

# one time configs
email='frankieteardrop%gmail.com'
git config --global user.name 'Lihan Li'
git config --global user.email ${email/\%/@}
git config --global core.excludesfile $dir/gitignore_global

if [[ $OSTYPE =~ ^darwin.*$ ]]; then
	git config --global core.editor 'subl -n -w'
fi
echo 'install complete'