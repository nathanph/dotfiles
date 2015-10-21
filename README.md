# dotfiles

###Download and Move Necessary Files
```
$ git clone https://github.com/nathanph/dotfiles ~/dotfiles
$ cp ~/dotfiles/.* ~/
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

###Install Vim and Plugins
1. Install Vim (should be version 7.4 or higher)
  * Mac `$ brew install vim --override-system-vi; alias vim=/usr/local/Cellar/vim/7.4.712/bin/vim`
  * Ubuntu `$ apt-get install vim`
2. Install Plugins
  * `$ vim +PluginInstall +qall`



