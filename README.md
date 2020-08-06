## Install

git clone in to ~/.config/

## Install VIM-Plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Install Plugins

Commands:

```
:PlugInstall
```

## Install COC plugins

Commands:

```
:CocInstall
```

## Change Config

```
nvim ~/.config/nvim/init.vim
```

## Requirements

deoplete requires Neovim or Vim8 with if_python3.

```
pip3 install --user pynvim
```
