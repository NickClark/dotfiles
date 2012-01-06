Nicks Dotfiles - README
=======================

This is just a collection of my personal dot files used with oh-my-zsh
and janus.

Install
-------
1. First be sure you have the neccessary dependencies installed. On debian
you would run:
        
        sudo apt-get install curl git ruby rake build-essential ruby1.8-dev

2. Install [rvm](http://beginrescueend.com/)

3. Then run the folling commands:
        
        git clone https://github.com/NickClark/dotfiles.git ~/.dotfiles
        cd ~/.dotfiles 
        rake

3. That should be it. The first thing I usually do now is run
       
        rvm install 1.9.2 && rvm use 1.9.3 --default
