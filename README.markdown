Nicks Dotfiles - README
=======================

This is just a collection of my personal dot files used with oh-my-zsh
and janus.

Install
-------
1. First be sure you have the necessary dependencies installed. On debian
you would run:

        sudo apt-get install git ruby rake python
(python is probably already installed)

2. Install [rvm](http://beginrescueend.com/)

3. Then run the folling commands:

        git clone https://github.com/NickClark/dotfiles.git ~/.dotfiles
        cd ~/.dotfiles
        rake

4. Install Powerline compatible fonts by following the
   instructions [here](https://github.com/Lokaltog/powerline-fonts) (optional, Powerline will still work, just
won't look as nice)

5. You may want to copy the config files for powerline and customize them as you desire.

       mkdir ~/.config/powerline
       cp -R ~/.dotfiles/vim/bundle/powerline/powerline/config_files/* ~/.config/powerline

5. Change your shell to zsh (optional) `chsh -s /bin/zsh`

Troubleshooting
---------------
I had problems with getting macvim from homebrew to link to my updated
version of python. Found an answer [here](http://superuser.com/questions/440981/how-can-i-use-the-homebrew-python-version-with-homebrew-macvim-on-snow-leopard/440982#440982)
