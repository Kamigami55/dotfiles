# dotfiles
My unix config files :heart:

- Shell: **[zsh](https://github.com/zsh-users/zsh)**
- Zsh plugin manager: **[antigen](https://github.com/zsh-users/antigen)**
- Editor: **[vim](https://github.com/vim/vim)**
- Vim plugin manager: **[vim-plug](https://github.com/junegunn/vim-plug)**
- Terminal mutiplexer: **[tmux](https://github.com/tmux/tmux)**
- Tmux plugin manager: **[tpm](https://github.com/tmux-plugins/tpm)**

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

而zsh的plugin會在下次使用zsh時自動安裝

## Uninstall

**uninstall.sh** 會刪除所有 **install.sh** 建立的 soft links

```
cd ~/dotfiles
./uninstall.sh
```
