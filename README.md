# Mac or Ubuntu 环境配置

## Homebrew

## 软件列表

### 安装 fd，比 find 更快的文件查找，作为 fzf 的底层查找命令

- 参考：https://github.com/sharkdp/fd

- 示例

  ```shell
  wget https://github.com/sharkdp/fd/releases/download/v7.2.0/fd-musl_7.2.0_amd64.deb
  sudo dpkg -i fd-musl_7.2.0_amd64.deb
  ```

### 安装 fzf

- 参考
  https://github.com/junegunn/fzf
  https://www.jianshu.com/p/bb91582317ed
  https://keelii.com/2018/08/12/fuzzy-finder-full-guide/

- 示例
  ```shell
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  ```

### 安装 highlight，高亮语法显示，fzf 中用到

- 参考: http://www.andre-simon.de/doku/highlight/en/highlight.php

- 示例

  ```shell
  # Ubuntu
  sudo apt-get install liblua5.3-dev
  wget http://www.andre-simon.de/zip/highlight-3.48.tar.bz2
  tar xjf highlight-3.48.tar.bz2
  cd highlight-3.48
  make help
  make
  make install # (depending on your installation destination, you need to be root)

  # Mac
  brew install highlight
  ```

### 安装 ag (the_silver_searcher)

- 参考：https://github.com/ggreer/the_silver_searcher

- 示例

  ```shell
  # Mac
  brew install the_silver_searcher
  # Ubuntu
  apt-get install silversearcher-ag
  ```

### ctags (neovim 的插件需要)

- 参考 https://jdhao.github.io/2018/09/28/nvim_tagbar_install_use/

## iTerm2

- 安装字体
  参考：https://github.com/powerline/fonts

  ```shell
  # clone
  git clone https://github.com/powerline/fonts.git --depth=1
  # install
  cd fonts
  ./install.sh
  # clean-up a bit
  cd ..
  rm -rf fonts
  ```

  个人比较喜欢的字体是**Noto Mono for Powerline**

- 安装 scheme, 配色
  参考: https://github.com/mbadolato/iTerm2-Color-Schemes
  下载后, 在 Preferences->Profiles->Colors->Color Presets->Import...
  个人比较喜欢的配色是**Solarized Dark Higher Contrast**

## Z Shell

- 安装方法

- 设置 zsh 为默认

  - 检查当前 shell

    ```shell
    echo $SHELL
    ```

  - 如果不是 zsh, 按照如下方式可以设置
    - Go to System Preferences
    - Click on "Users & Groups"
    - Click the lock to make changes.
    - Right click the current user -> Advanced options
    - Change the login shell to /bin/zsh in the dropdown.
    - Open a new terminal and verify with echo \$SHELL
      参考：https://stackoverflow.com/questions/31034870/making-zsh-default-shell-in-macosx

- Oh-my-zsh

  - 安装方法
    参考[官网](https://ohmyz.sh/)

    ```shell
    sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```

  - 在 .zshrc 中添加下面配置

    ```shell
    # prevent ctr-d from exiting the shell
    set -o ignoreeof

    # fzf config
    export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

    ```

## Tmux

- 修改 tmux/tmux.config 为 .tmux.config，然后放置在 HOME 目录下

  参考：http://louiszhai.github.io/2017/09/30/tmux/#Tmux%E5%BF%AB%E6%8D%B7%E6%8C%87%E4%BB%A4

- .tmux.config 中, 按需选用 tmux-256color 或者 xterm-256color, 使用 `echo $TERM` 查看当前的环境, 否则会出现按键失灵, 比如 backspace 键

  ```shell
  # set -g default-terminal "tmux-256color"
  set -g default-terminal "xterm-256color"
  ```

- 使用系统粘贴板, 需要安装特定的扩展

  - Linux:

    ```shell
    sudo apt-get install xclip
    ```

  - Mac:

    ```shell
    brew install reattach-to-user-namespace
    ```

- 安装 tpm

  ```shell
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

- 修改后的常用快捷键

  - c-a, `: 前者是主 prefix, 后者是副的
  - prefix + r: 重载配置
  - prefix + s: 列出所有 session
  - prefix + w: 列出所有 window
  - prefix + |: 垂直创建新面板
  - prefix + -: 水平创建新面板
  - prefix + k/j/h/l: 切换面板
  - prefix + e/c-e: 选择最后一个面板/窗口
  - prefix + c-u/c-d: 与前/后面板交换位置
  - prefix + m: 新面板打开 man 手册
  - prefix + P: 保存输出的日志
  - prefix + c-s: save session
  - prefix + c-r: restore session
  - prefix + I: 下载插件
  - prefix + U: 更新插件
  - prefix + alt + U: 卸载插件
  - prefix + ,: 重命名 window
  - prefix + $: 重命名 session
  - prefix + c: 新开 window
  - prefix + n: 切换到下一个 window

- 在.zshrc 中添加 tmux 插件后, shell 支持的 tmux 快捷为
  - ta: tmux attach -t
  - tad: tmux attach -d -t
  - ts: tmux new-session -s
  - tl: tmux list-sessions
  - tksv: tmux kill-server
  - tkss: tmux kill-session -t

## neovim

- 安装 Neovim
  参考: https://neovim.io/

- 让 neovim 为默认 vim.

  - Mac, 添加配置到 .zshrc

    ```shell
    alias vim='nvim'
    ```

  - Ubuntu
    ```shell
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor
    ```

- 安装 python 依赖 neovim, jedi

  ```shell
  pip install neovim jedi --user # 这步很关键，plugin注册需要
  ```

- 安装 autopep8

  ```shell
  pip install --upgrade autopep8
  ```

- 安装 fd，比 find 更快的文件查找，作为 fzf 的底层查找命令
  参考：https://github.com/sharkdp/fd

  ```shell
  wget https://github.com/sharkdp/fd/releases/download/v7.2.0/fd-musl_7.2.0_amd64.deb
  sudo dpkg -i fd-musl_7.2.0_amd64.deb
  ```

- 安装 fzf
  参考：https://github.com/junegunn/fzf
  参考：https://www.jianshu.com/p/bb91582317ed
  参考：https://keelii.com/2018/08/12/fuzzy-finder-full-guide/

  ```shell
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  ```

- 安装 highlight，高亮语法显示，fzf 中用到
  参考: http://www.andre-simon.de/doku/highlight/en/highlight.php

  ```shell
  # Ubuntu
  sudo apt-get install liblua5.3-dev
  wget http://www.andre-simon.de/zip/highlight-3.48.tar.bz2
  tar xjf highlight-3.48.tar.bz2
  cd highlight-3.48
  make help
  make
  make install # (depending on your installation destination, you need to be root)

  # Mac
  brew install highlight
  ```

- 安装 ag (the_silver_searcher)
  参考：https://github.com/ggreer/the_silver_searcher

  ```shell
  # Mac
  brew install the_silver_searcher
  # Ubuntu
  sudo apt-get install silversearcher-ag
  ```

- 安装 ctags (neovim 的插件需要)
  参考 https://jdhao.github.io/2018/09/28/nvim_tagbar_install_use/

- 安装 vim-plug

  ```shell
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

- 创建 neovim config 目录，并将 init.vim 放置其中

  ```shell
  mkdir -p ~/.config/nvim && cd ~/.config/nvim
  nvim -c UpdateRemotePlugins
  ```

- 根据系统修改 python3 配置

  ```shell
  let g:python_host_prog="/path/to/your/python3/"
  ...
  let g:deoplete#sources#jedi#python_path = "/path/to/your/python3/"
  ```

- Tern -- Javascript 补全插件
  将 tern-config，放入\$HOME 目录，并改名为.tern-config

## JetBrains (PhpStrom, PyCharm) 配置

- 导入 BobSettings.jar 即可

## VS Code 配置

## ==== 新环境配置 (待整理) ====

```shell

Tmux:
sudo apt-get install libevent-dev
sudo apt-get install libncurses-dev
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo make install

Neovim:
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

Zsh:
sudo apt-get install zsh
sudo usermod -s /bin/zsh sunyubo

Oh-my-zsh:
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## FAQ

### 启动 Tumx 遇到如下错误 (Tmux v2.1)

```shell
/home/sunyubo/.tmux.conf:68: usage: send-keys [-lRM] [-t target-pane] key ...
/home/sunyubo/.tmux.conf:69: usage: send-keys [-lRM] [-t target-pane] key ...
/home/sunyubo/.tmux.conf:200: unknown option: pane-border-status
/home/sunyubo/.tmux.conf:201: unknown option: pane-border-format
```

==> 需要更新 Tmux (Tmux 2.9)
