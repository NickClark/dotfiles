# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

#android tools
export PATH=/usr/local/sbin:/usr/local/lib/node_modules:/usr/local/bin:/usr/local/mysql/bin:/Developer/SDKs/android-sdk-mac_x86/tools:/Developer/SDKs/android-sdk-mac_x86/platform-tools:$PATH

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bira"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails osx git textmate ruby lighthouse)
plugins=(ruby rails3 osx git powder rvm brew bundler gem)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
unsetopt auto_name_dirs
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

function r() {
  cd ~/code/$1;
  gvim app/controllers/application_controller.rb
  guard -c
}

function c() {
  cd ~/code/$1;
}

compdef '_files -W ~/code -/' c r

alias phone_web='adb forward tcp:9222 localabstract:chrome_devtools_remote'

#alias guard='guard -c'

export EDITOR='gvim -f'
#export CC=/usr/bin/gcc-4.2
