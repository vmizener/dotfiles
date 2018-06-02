# dotfiles
My personalized dotfiles

| File | Location | Notes |
| :---: | :---: | :---: |
| baozi.zsh-theme | .oh-my-zsh/custom/themes | oh-my-zsh |
| config | .ssh ||
| gitignore | ~ ||
| init.vim | .config/nvim | vim plugged |
| init.zsh | .oh-my-zsh/custom | oh-my-zsh |
| nethackrc | ~ ||
| screenrc | ~ ||
| tmux.conf | ~ | install submodule and link in ~/.tmux|
| vimrc | ~ | vim 8+ |
| zshrc | ~ ||

oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

plugged
```bash
# neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

tmux
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
