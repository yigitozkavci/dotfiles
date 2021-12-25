dir=~/dotfiles
dotfile_dir=~/dotfiles/dotfiles
config_dir=~/dotfiles/configs
files=$(find ./dotfiles/* -type f -exec basename {} \;)
vim_path=~/.vim
vim_colors_path=~/.vim/colors
alacritty_config_destination=~/.config/alacritty/alacritty.yml

for file in $files; do
  if [[ -f $dotfile_dir/$file && ! -f ~/.$file ]]; then
    echo "Checking; ~/.$file"
    if [ -L ~/.$file ]; then
      echo "Deleted: ~/.$file"
      rm ~/.$file
    fi
    ln -s $dotfile_dir/$file ~/.$file
    echo "File connected: $dir/$file"
  fi
done

if ! [[ -d ~/.config/alacritty ]]; then
  mkdir -p ~/.config/alacritty
fi
if ! [[ -f $alacritty_config_destination ]]; then
  echo "Setting up Alacritty config..."
  ln -s $config_dir/alacritty.yml $alacritty_config_destination
fi

if ! [[ -d $vim_colors_path ]]; then
  mkdir -p $vim_colors_path
fi

for color in $(find $dir/.vim/colors/*); do
  if ! [[ -f $color ]]; then
    echo "Connecting $color";
    ln -s $color $vim_colors_path/
  fi
done

command_exists () {
    type "$1" &> /dev/null ;
}

if ! [[ -d $vim_path/bundle/Vundle.vim ]]; then
  echo "Vundle is not installed, installing...";
	if ! command_exists git ; then
		echo "Git is not installed. Install it and execute the script again."
    exit 1
	else
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi
fi

is_linux () {
  uname=$(uname -a)
  [[ "$uname" == *"Linux"* ]] && return
  false
}

is_os_x () {
  uname=$(uname -a)
  [[ "$uname" == *"Darwin"* ]] && return
  false
}

if ! command_exists zsh ; then
  if is_linux; then
    sudo apt-get install zsh # Get zsh
  elif is_os_x; then
    brew install zsh zsh-completions # Get zsh
  fi
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Get oh-my-zsh
fi

if ! [[ -d ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Install completed."
echo "Reminders:"
echo "1) After executing tmux, type <prefix>I to install tmux plugins"
echo "2) After executing vim, type :PluginInstall<CR> to install vim plugins"
exit 0
