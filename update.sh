echo "Copying nvim"
cp -r ~/.config/nvim/ ./ --debug
echo "Copying sway"
cp -r ~/.config/sway/ ./ --debug
echo "Copying waybar"
cp -r ~/.config/waybar/ ./ --debug
echo "Copying zshrc and bashrc"
cp -r ~/.zshrc ~/.bashrc ./SHELL/ --debug
echo "Copying ranger"
cp -r ~/.config/ranger/ ./ --debug
echo "Copying vim"
cp -r ~/.vim/* ./vim/ --debug
echo "Copying vimrc"
cp ~/.vimrc ./vim/ --debug
echo "Copying emacs"
cp -r ~/.emacs.d/ ./emacs/ --debug
echo "Copy Finished"
