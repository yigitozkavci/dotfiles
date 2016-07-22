dir=~/dotfiles
files=$(find *)
for file in $files; do
    ln -s $dir/$file ~/.$file
done
