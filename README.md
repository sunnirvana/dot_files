# 环境配置 (Mac/Ubuntu)

## 安装软件

- 安装 fd，比 find 更快的文件查找，作为 fzf 的底层查找命令 https://github.com/sharkdp/fd

  ```shell
  # Mac
  brew install fd

  # Ubuntu
  wget https://github.com/sharkdp/fd/releases/download/v7.2.0/fd-musl_7.2.0_amd64.deb
  sudo dpkg -i fd-musl_7.2.0_amd64.deb
  ```

- 安装 fzf https://github.com/junegunn/fzf https://www.jianshu.com/p/bb91582317ed https://keelii.com/2018/08/12/fuzzy-finder-full-guide/

  ```shell
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  ```

- 安装 highlight，高亮语法显示 http://www.andre-simon.de/doku/highlight/en/highlight.php

  ```shell
  # Mac
  brew install highlight

  # Ubuntu
  sudo apt-get install liblua5.3-dev
  wget http://www.andre-simon.de/zip/highlight-3.48.tar.bz2
  tar xjf highlight-3.48.tar.bz2
  cd highlight-3.48
  make help
  make
  make install # (depending on your installation destination, you need to be root)

  ```

- 安装 ag (the_silver_searcher) https://github.com/ggreer/the_silver_searcher

  ```shell
  # Mac
  brew install the_silver_searcher

  # Ubuntu
  apt-get install silversearcher-ag -y
  ```

- ctags (neovim 的插件需要) https://jdhao.github.io/2018/09/28/nvim_tagbar_install_use/

- 使用系统粘贴板, 需要安装特定的扩展

  ```shell
  # Mac
  brew install reattach-to-user-namespace

  # Ubuntu
  sudo apt-get install xclip  -y
  ```

## iTerm2

- 安装字体 https://github.com/powerline/fonts

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

- 安装 scheme, 配色参考: https://github.com/mbadolato/iTerm2-Color-Schemes
  下载后, 在 Preferences->Profiles->Colors->Color Presets->Import...
  个人比较喜欢的配色是**Solarized Dark Higher Contrast**

## Z Shell

- 安装方法

  ```shell
  # Ubuntu
  sudo apt-get install zsh
  echo $SHELL
  sudo chsh -s /bin/zsh
  
  if [ "$SHELL" != "/bin/zsh" ]
  then
     export SHELL="/bin/zsh"
     exec /bin/zsh -l    # -l: login shell again
  fi


  # Mac
  brew install zsh
  # https://stackoverflow.com/questions/31034870/making-zsh-default-shell-in-macosx
  # System Preferences -> Users & Groups -> Unlock -> Right click the current user -> Advanced options -> Change the login shell to /bin/zsh
  ```

## Oh-my-zsh

- 安装方法 https://ohmyz.sh/

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

- 安装最新 Tmux

  ```shell
  # Ubuntu
  sudo apt-get install -y libevent-dev libncurses-dev
  git clone https://github.com/tmux/tmux.git
  cd tmux && sh autogen.sh && ./configure && make
  sudo make install

  # Mac
  brew install tmux
  ```

- 安装 tpm

  ```shell
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

- 使用 .tumx.conf 配置, 拷贝和软连接均可 http://louiszhai.github.io/2017/09/30/tmux/#Tmux%E5%BF%AB%E6%8D%B7%E6%8C%87%E4%BB%A4

- .tmux.config 中, 按需选用 tmux-256color 或者 xterm-256color, 使用 `echo $TERM` 查看当前的环境, 否则会出现按键失灵, 比如 backspace 键

  ```shell
  # set -g default-terminal "tmux-256color"
  set -g default-terminal "xterm-256color"
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
  - prefix + \$: 重命名 session
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

- 安装 https://neovim.io/

  ```shell
  # Ubuntu
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt-get update
  sudo apt-get install -y neovim python-dev python-pip python3-dev python3-pip

  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && sudo update-alternatives --config vi
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && sudo update-alternatives --config vim
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 && sudo update-alternatives --config editor

  # Mac
  brew install neovim
  ```

- 让 neovim 为默认 vim.

  ```shell
  # Ubuntu
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && sudo update-alternatives --config vim && sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 && sudo update-alternatives --config editor

  # Mac 修改.zshrc
  alias vim='nvim'
  ```

- 安装 python 依赖 neovim, jedi, autopep8

  ```shell
  pip install neovim jedi --user # 这步很关键，plugin注册需要
  pip install --upgrade autopep8
  ```

- 安装 vim-plug

  ```shell
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

- 创建 neovim config 目录，并将 init.vim 放置其中, 软连接也可

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

- Tern, Javascript 补全插件
  将 tern-config，放入\$HOME 目录，并改名为.tern-config

## JetBrains (PhpStrom, PyCharm) 配置

- 导入 BobSettings.jar 即可

## VS Code 配置

- 拷贝或者软连接 vscode/User 内容到"~/Library/Application Support/Code/User"

- 安装 extensions, extensions.txt
