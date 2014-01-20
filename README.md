# Installing dot-files
Very simply clone this repository into your `$HOME` directory, run
the following commands, and you'll be good to go!

    cd ~
    git clone http://github.com/merky/dotfiles.git
    mv dotfiles/.??* dotfiles/* .
    git submodule sync
    git submodule init
    git submodule update
    rm -r dotfiles

