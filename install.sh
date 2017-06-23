dir=~/dotfiles
dotfile_dir=~/dotfiles/dotfiles
files=$(find ./dotfiles/* -type f -exec basename {} \;)
vim_path="~/.vim"
vim_colors_path="~/.vim/colors"
vim_colors=$(find .vim/colors/*)

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
  mkdir $vim_colors_path
fi

for color in $vim_colors; do
  if ! [ -f $dir/$color ]; then
    ln -s $dir/$color ~/$color
  fi
done

echo "Install completed."
