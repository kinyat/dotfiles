# dotfiles

## Pre-Install

1. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

2. Install [powerlevel9k](https://github.com/bhilburn/powerlevel9k)

3. Install [powerline-font](https://github.com/powerline/fonts)

## Install

1. Git Clone in your home dir

    ```bash
    git clone git@github.com:kinyat/dotfiles.git
    ```

2. Simply symlink the dotfile you want

    ```bash
    ln -s ~/dotfiles/.vimrc
    ln -s ~/dotfiles/.tmux.conf
    ln -s ~/dotfiles/.zshrc
    ln -s ~/dotfiles/.ackrc
    ```

3. Make your terminal to run the following script when opening

    ```bash
    # Mac iTerm2
    tmux ls && read tmux_session && tmux -2 attach -t ${tmux_session:-default} || tmux -2 new -s ${tmux_session:-default}

    # Ubuntu Terminal
    sh -c "tmux ls && read tmux_session && tmux -2 attach -t ${tmux_session:-default} || tmux -2 new -s ${tmux_session:-default}"
    ```

4. To make clipboard works in Ubuntu

    ```bash
    sudo apt install -y vim-gtk xclip
    ```

5. Custom setting for Mac in Tmux

    ```bash
    # edit .tmux.conf and uncomment the following
    set -g default-command "reattach-to-user-namespace -l ${SHELL}"
    ```

6. Insatll [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#installation)
