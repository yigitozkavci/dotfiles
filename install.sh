dir=~/dotfiles
dotfile_dir=~/dotfiles/dotfiles
files=$(find ./dotfiles/* -type f -exec basename {} \;)
vim_path="~/.vim"
vim_colors_path="~/.vim/colors"
vim_colors=$(find .vim/colors/*)
for file in $files; do
  if [ -f $dotfile_dir/$file ]; then
    echo "Checking: ~/.$file "
    ln -s $dir/$file ~/.$file
    echo "File connected: $dir/$file"
  fi
done

for color in $vim_colors; do
  if ! [ -f $dir/$color ]; then
    ln -s $dir/$color ~/$color
  fi
done

echo "Install completed."
