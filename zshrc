export ZSH=$HOME/.dotfiles/oh-my-zsh
export EDITOR='vim'

#export PATH=~/Code/mingw-w32/bin:$PATH
#export PATH=~/Code/mingw-w32/mingw/bin/:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$PATH:/Applications/Android\ Studio.app/sdk/tools
export PATH=$PATH:/Applications/Android\ Studio.app/sdk/platform-tools

#Setup go
export GOPATH=$HOME/.go

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails osx git textmate ruby lighthouse)
plugins=(ruby rails osx bundler git brew npm node bower gem zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Powerline path setup
export PYTHONPATH=$PYTHONPATH:~/.dotfiles/vim/bundle/powerline
export PATH=$PATH:~/.dotfiles/vim/bundle/powerline/scripts

# Wire in Powerline
powerline-daemon -q
. $HOME/.dotfiles/vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh

# Customize to your needs...
unsetopt auto_name_dirs

function r() {
  cd ~/code/$1;
  gvim app/controllers/application_controller.rb
  guard -c
}

function c() {
  cd ~/code/$1;
}

function nct() {
  cd ~/code/$1;
  $name=${PWD##*/}
  tmux new -s $name 'vim .' -d
  tmux -t $name new-window -n 'term'
  tmux select-window -t $name:1
}

function nrt() {
  cd ~/code/$1;
  name=${PWD##*/}
  tmux new -d -s $name -n 'vim' 'vim .'
  tmux new-window -t $name -n 'zeus' 'zsh -c zeus start'
  tmux new-window -t $name -n 'console' 'zsh -c zeus rails c'
  tmux new-window -t $name -n 'server' 'zsh -c zeus rails s'
  tmux new-window -t $name -n 'log' 'zsh -c tail -f log/development.log'
  tmux move-window -t $name -r -s 'zeus' -t 'log'
  tmux select-window -t 'vim'
  tmux attach -t $name
}

compdef '_files -W ~/code -/' c r nct nrt

alias phone_web='adb forward tcp:9222 localabstract:chrome_devtools_remote'
alias nt='tmux new -s ${PWD##*/}'

alias z='zeus'
alias zeus='nocorrect zeus'

#Ruby performance
#export RUBY_GC_MALLOC_LIMIT=60000000
#export RUBY_FREE_MIN=200000

# point rbenv to brew's directory
export RBENV_ROOT=/usr/local/var/rbenv
# load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Direnv
eval "$(direnv hook $0)"
