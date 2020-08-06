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

## Neo Vim for VSCode

https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim

### Installation

- Install [vscode-neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) extension
- Install [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) Required version 0.4.2 or greater
- If you already have big & custom init.vim i'd recommend to wrap existing settings & plugins with if !exists('g:vscode') check to prevent potential breakings and problems

Neovim 0.4+ is required. Any version lower than that won't work. Many linux distributions have an old version of neovim in their package repo - always check what version are you installing.
