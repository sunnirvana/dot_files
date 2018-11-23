## 安装依赖
- 安装neovim

- 安装python依赖neovim, jedi
```shell
pip install neovim jedi --user # 这步很关键，plugin注册需要
```
- 安装ctags
参考[这里](https://jdhao.github.io/2018/09/28/nvim_tagbar_install_use/)

- 本配置来源
[这里](https://jdhao.github.io/2018/09/28/nvim_tagbar_install_use/)

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

## 修改tmux.config 为 .tmux.confg，然后放置在$HOME目录下
**注意**
按需选用 tmux-256color 或者 xterm-256color, 使用 echo $TERM 查看当前的环境
否则会出现按键失灵，比如backspace键不好用
修改
```shell
# set -g default-terminal "tmux-256color"
set -g default-terminal "xterm-256color"
```
