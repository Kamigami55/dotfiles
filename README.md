# dotfiles
My unix config files :heart:

- Shell: **zsh**
- Zsh plugin manager: **antigen**
- Editor: **vim**
- Vim plugin manager: **Vundle**
- Terminal mutiplexer: **tmux**

## Install

```
cd ~
git clone https://github.com/Kamigami55/dotfiles/
cd dotfiles
./install.sh
```

不過還有一些安裝步驟尚未自動化，需要手動操作：

git submodule要自己init、update
```
git submodule init
git submodule update
```

vim vundle要自己下PluginInstall
```
vim
:PluginInstall
```

tmux要手動安裝
```
tmux
<prefix> + <I>
```

要手動切換到zsh
```
chsh -s /usr/bin/zsh
```

並且下次使用zsh時會自動安裝zsh plugin

而且尚未測試過重複執行./install.sh會發生什麼事，以及當下環境已有一些.rc設定時，是否會衝突

建議只在全新的環境安裝我的這些dotfiles

有空再來讓這些變自動化

## Uninstall

**uninstall.sh** 會刪除所有 **install.sh** 建立的 soft links

```
cd ~/dotfiles
./uninstall.sh
```
