dir=~/dotfiles
files=$(find *)
vim_path="~/.vim"
vim_colors_path="~/.vim/colors"
vim_colors=$(find .vim/colors/*)
for file in $files; do
  ln -s $dir/$file ~/.$file
done

for color in $vim_colors; do
  ln -s $dir/$color ~/$color
done
