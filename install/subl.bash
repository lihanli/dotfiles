# find sublime directory
if [ -d ~/.config/sublime-text-2 ]; then
  sublime_dir=~/.config/sublime-text-2
else
  sublime_dir="$HOME/Library/Application Support/Sublime Text 2"
fi
# if directory doesnt exist then exit
user_dir=$sublime_dir/Packages/User
[[ ! -e $user_dir ]] && return
# symlink user directory
if [[ ! -L $user_dir ]]; then
  mv $user_dir $sublime_dir/Packages/User_old
  ln -s $dotfiles_dir/sublime/User $user_dir
fi