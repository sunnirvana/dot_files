## 安装依赖
- 本配置来源
[这里](https://jdhao.github.io/2018/09/05/centos_nvim_install_use_guide/)

- 安装Neovim
[这里](https://neovim.io/)

- 安装vim-plug 
```shell
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


- Mac
直接修改.zshrc (假如是zshell)
```shell
alias vim='nvim'
```

- Ubuntu 配置: 让 neovim 为默认 vim
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor


- 安装python依赖neovim, jedi
```shell
pip install neovim jedi --user # 这步很关键，plugin注册需要
```

-- 安装autopep8
```shell
pip install --upgrade autopep8
```

- 安装ctags (neovim 的插件需要)
参考[这里](https://jdhao.github.io/2018/09/28/nvim_tagbar_install_use/)

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

## 创建neovim config目录，并将init.vim放置其中
```shell
mkdir -p ~/.config/nvim && cd ~/.config/nvim
nvim -c UpdateRemotePlugins
```
**注意修改**
```shell
let g:python_host_prog="/path/to/your/python3/"
...
let g:deoplete#sources#jedi#python_path = "/path/to/your/python3/"
```
### Tern -- Javascript 补全插件
将tern-config，放入$HOME目录，并改名为.tern-config

## 修改tmux.config 为 .tmux.confg，然后放置在$HOME目录下

参考[文章](http://louiszhai.github.io/2017/09/30/tmux/#Tmux%E5%BF%AB%E6%8D%B7%E6%8C%87%E4%BB%A4)

### 按需选用 tmux-256color 或者 xterm-256color, 使用 echo $TERM 查看当前的环境
否则会出现按键失灵，比如backspace键不好用
修改
```shell
# set -g default-terminal "tmux-256color"
set -g default-terminal "xterm-256color"
```

### 修改后的常用快捷键
c-a, \`: 前者是主prefix, 后者是副的
prefix + r: 重载配置
prefix + |: 垂直创建新面板
prefix + -: 水平创建新面板
prefix + k/j/h/l: 切换面板
prefix + e/c-e: 选择最后一个面板/窗口
prefix + c-u/c-d: 与前/后面板交换位置
prefix + m: 新面板打开man手册
prefix + P: 保存输出的日志
prefix + c-s: save session
prefix + c-r: restore session


### 使用系统粘贴板
Linux:
```shell
sudo apt-get install xclip
```
Mac:
```shell
brew install reattach-to-user-namespace
```

## 使用oh-my-zsh
前提是已经安装了zsh https://ohmyz.sh/


## PyCharm / PhpStorm 的配置文件
导入 BobSettings.jar 即可

