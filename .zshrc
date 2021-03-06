# Path to your oh-my-zsh installation.
export ZSH=/home/nate/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line to enable faster escape key detection (10ms)
KEYTIMEOUT=1

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vagrant bower brew bundler compleat dircycle dirhistory docker encode64 fasd gem gitfast git-extras git-flow history jsontools knife npm node pyenv python sudo common-aliases vi-mode zsh-autosuggestions zsh-syntax-highlighting tmux)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
# ZSH_TMUX_AUTOQUIT=false

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/games"
export PATH="$PATH:$HOME/.npm-packages/bin"
export PATH="$PATH:/opt/devkitpro/devkitARM/bin/"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias pip=pip3
# alias python=python3

# Accept suggestions without leaving insert mode
bindkey '^f' vi-forward-word
# or
bindkey '^f' vi-forward-blank-word

# Aliases
alias ls='ls -h --color --group-directories-first'

if type "archeyjs" > /dev/null; then
    archeyjs
elif type "screenfetch" > /dev/null; then
    screenfetch
elif type "archey" > /dev/null; then
    archey
fi

if type "python3" > /dev/null; then
    alias python=python3
fi

if type "pip3" > /dev/null; then
    alias pip=pip3
fi

if type "vim" > /dev/null; then
    alias vimrc='vim ~/.vimrc'
    alias zshrc='vim ~/.zshrc'
    alias tmuxconf='vim ~/.tmux.conf'
    alias tmuxrc='vim ~/.tmux.conf'
fi
