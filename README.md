## 安装依赖
- 本配置来源
[这里](https://jdhao.github.io/2018/09/28/nvim_tagbar_install_use/)

- 安装neovim

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
**注意**

按需选用 tmux-256color 或者 xterm-256color, 使用 echo $TERM 查看当前的环境
否则会出现按键失灵，比如backspace键不好用
修改
```shell
# set -g default-terminal "tmux-256color"
set -g default-terminal "xterm-256color"
```

## 使用oh-my-zsh
前提是已经安装了zsh https://ohmyz.sh/


## PyCharm / PhpStorm 的配置文件
导入 BobSettings.jar 即可

