source $dotfiles_install_dir/subl.bash

[[ ! -e '/usr/bin/subl' ]] && sudo ln -s "$dotfiles_dir/scripts/linux_desktop/subl" '/usr/bin/subl'