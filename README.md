# dotfiles
My unix config files :heart:

- Shell: **[zsh](https://github.com/zsh-users/zsh)**
- Zsh plugin manager: **[antigen](https://github.com/zsh-users/antigen)**
- Editor: **[vim](https://github.com/vim/vim)**
- Vim plugin manager: **[vim-plug](https://github.com/junegunn/vim-plug)**
- Terminal mutiplexer: **[tmux](https://github.com/tmux/tmux)**
- Tmux plugin manager: **[tpm](https://github.com/tmux-plugins/tpm)**

## Prerequisite

- brew
- zsh (MacOS built-in)
- vim (MacOS built-in)
- tmux
- Powerline font

### Prerequisite - Install tmux

On Mac, we install tmux using brew, Let's install brew first:

https://brew.sh/index_zh-tw.html

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then, install tmux:

```
brew install tmux
```

### Prerequisite - Install Powerline font

This is for my zsh theme

https://github.com/Homebrew/homebrew-cask-fonts

```
brew tap homebrew/cask-fonts
brew install font-menlo-for-powerline
```

Then change font of shell (in my case iTerms2) to **Source Code Pro for Powerline**

## Install

```
cd ~
git clone https://github.com/Kamigami55/dotfiles/
cd dotfiles
./install.sh
```

不過還有一些安裝步驟尚未自動化，需要手動操作：


vim編輯器我用**vim-plug**來管理套件，需要手動下指令來安裝套件：

```
vim
:PlugInstall
```

tmux我使用**tpm**來管理套件，也需要手動下指令來安裝套件（注意**a,I**大小寫）：

```
tmux
<Ctrl+a> + <I>
```

Install zsh autojump

https://github.com/wting/autojump#os-x

```
brew install autojump
```

## Advanced configuration

Create .zshrc.local to set machine local configs

Like: Enabling nvm, Set prombt background color for this machine

```
cp .zshrc.local.example .zshrc.local
```

而zsh的plugin會在下次使用zsh時自動安裝

## Uninstall

**uninstall.sh** 會刪除所有 **install.sh** 建立的 soft links

```
cd ~/dotfiles
./uninstall.sh
```
