Nick's Dotfiles - README
=======================

This is just a collection of my personal dot files. Vim plugins are managed
using git submodules

Install
-------
1. First be sure you have the necessary dependencies installed. On Debian
you would run:

        sudo apt-get install git ruby rake python silversearcher-ag

   or on Mac OSX:

        brew install macvim --override-system-vim
        brew install cmake git
        brew install the_silver_searcher #better Ack (provides the 'ag' command)
        brew install reattach-to-user-namespace #To fix tmux issues with OSX (launchctrl, copy/paste, etc)

2. Install ruby (I recommend either [rbenv](http://rbenv.org/) or
[rvm](http://beginrescueend.com/) to manage your rubies)

3. Then run the following commands:

        git clone https://github.com/NickClark/dotfiles.git ~/.dotfiles
        cd ~/.dotfiles
        rake

4. Install Powerline compatible fonts by following the
   instructions [here](https://github.com/Lokaltog/powerline-fonts) (optional, Powerline will still work, just
won't look as nice)

5. Build YouCompleteMe

        cd ~/.dotfiles/vim/bundle/YouCompleteMe && ./install.sh

6. Build ctrlp-cmatcher (much faster ctrlp)

        cd ~/.vim/bundle/ctrlp-cmatcher/ && ./install.sh

7. You may want to copy the config files for Powerline and customize them as you desire.

        mkdir ~/.config/powerline
        cp -R ~/.dotfiles/vim/bundle/powerline/powerline/config_files/* ~/.config/powerline

8. Change your shell to zsh (optional) `chsh -s /bin/zsh`

Troubleshooting
---------------
I had problems with getting MacVim from Homebrew to link to my updated
version of python. Found an answer [here](http://superuser.com/questions/440981/how-can-i-use-the-homebrew-python-version-with-homebrew-macvim-on-snow-leopard/440982#440982)

If you get zsh auto complete errors, make sure permissions are correct.

        compaudit                     #Discover what files are issues
        chmod -R go-w ~/.oh-my-zsh    #Fix them
        rm -f ~/.zcompdump*; compinit #Reload them (or restart the terminal session)
