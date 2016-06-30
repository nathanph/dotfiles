# dotfiles

###Download and Move Necessary Files
```
$ git clone https://github.com/nathanph/dotfiles ~/dotfiles
$ cp ~/dotfiles/.* ~/
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

###Install Vim and Plugins
1. Install Vim (should be version 7.4 or higher)
  * Mac `$ brew install vim --override-system-vi && alias vim=/usr/local/Cellar/vim/7.4.712/bin/vim`
  * Ubuntu `$ apt install vim-gtk`
2. Install Plugins
  * `$ vim +PluginInstall +qall`

### Install Zsh and Plugins
1. Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
2. Install the [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
   plugin.
3. Install the [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
   plugin.
