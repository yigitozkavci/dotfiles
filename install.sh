dir=~/dotfiles
dotfile_dir=~/dotfiles/dotfiles
files=$(find ./dotfiles/* -type f -exec basename {} \;)
vim_path=~/.vim
vim_colors_path=~/.vim/colors

for file in $files; do
  if [ -f $dotfile_dir/$file ]; then
    echo "Checking; ~/.$file"
    if [ -L ~/.$file ]; then
      echo "Deleted: ~/.$file"
      rm ~/.$file
    fi
    ln -s $dotfile_dir/$file ~/.$file
    echo "File connected: $dir/$file"
  fi
done

if ! [[ -d $vim_colors_path ]]; then
  mkdir -p $vim_colors_path
fi

for color in $(find $dir/.vim/colors/*); do
  echo "Connecting $color";
  ln -s $color $vim_colors_path/
done

command_exists () {
    type "$1" &> /dev/null ;
}

if ! [[ -d ~/.vim/bundle/Vundle.vim ]]; then
  echo "Vundle is not installed, installing...";
	if ! command_exists git ; then
		echo "Git is not installed. Install it and execute the script again."
    exit 1
	else
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi
fi

echo "Install completed."
exit 0
