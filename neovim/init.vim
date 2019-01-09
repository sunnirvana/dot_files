if has('macunix') "Mac
    let g:python_host_prog='/usr/local/anaconda3/bin/python3'
elseif has('unix') "Linux
    let g:python_host_prog='/usr/bin/python3.5'
endif

set nocompatible
filetype off

let mapleader=','

call plug#begin("~/.config/nvim/bundle")
" Plugin List
Plug 'rking/ag.vim'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/MatchTagAlways'
Plug 'bigeagle/molokai'
" 主题 底边状态栏
Plug 'bling/vim-airline' 
Plug 'scrooloose/nerdtree' 

Plug 'majutsushi/tagbar'
Plug 'jrosiek/vim-mark'
Plug 'kien/rainbow_parentheses.vim'

Plug 'mattn/emmet-vim'
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'zaiste/tmux.vim'
Plug 'lepture/vim-jinja'
Plug 'cespare/vim-toml'
Plug 'isRuslan/vim-es6'
" Plug 'elzr/vim-json'

Plug 'w0rp/ale'
Plug 'junegunn/fzf'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/echodoc.vim'
Plug 'davidhalter/jedi-vim'

"多点编辑, 选中ctrl+n,取消选中ctrl+x
Plug 'terryma/vim-multiple-cursors' 
"修改包围目标的符号，比如修改'abc' => <p>abc<p>
Plug 'tpope/vim-surround' 
"扩展repeat功能
Plug 'tpope/vim-repeat'
"visually select increasingly larger regions, + 扩展, _ 缩小
Plug 'terryma/vim-expand-region'
"注释 <leader>cc 取消注释 <leader>cu
Plug 'scrooloose/nerdcommenter' 
"格式化代码 :Neoformat
Plug 'sbdchd/neoformat' 
"高亮复制信息
Plug 'machakann/vim-highlightedyank' 
"折叠代码 zo, zO, zc, zC
Plug 'tmhedberg/SimpylFold' 
"主题
Plug 'morhetz/gruvbox' 
"显示当前文件tags，依赖ctag, 参考文章安装https://jdhao.github.io/2018/09/28/nvim_tagbar_install_use/
Plug 'majutsushi/tagbar' 
"自动补全括号
Plug 'Raimondi/delimitMate'

" for Javascript, from https://hackernoon.com/using-neovim-for-javascript-development-4f07c289d862
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
" Plug 'ludovicchabant/vim-gutentags'  " 使得自动补全不好用，关闭
"
" for vue
Plug 'posva/vim-vue'

" for fzf 文件搜索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" 为了diff
Plug 'chrisbra/vim-diff-enhanced'
call plug#end()

" UI
if !exists("g:vimrc_loaded")
	if has("nvim")
		set termguicolors
	endif
	"let g:molokai_original = 1
	"colorscheme molokai
	colorscheme gruvbox
	set background=dark " 或者 set background=light
endif " exists(...)

set so=10
set number
set ruler
syntax on
filetype on
filetype plugin on
filetype indent on

" 文件修改之后自动载入
set autoread

" history存储容量
set history=2000

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" F1 - F6 设置

" F1 废弃这个键,防止调出系统帮助
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
" function! HideNumber()
  " if(&relativenumber == &number)
    " set relativenumber! number!
  " elseif(&number)
    " set number!
  " else
    " set relativenumber!
  " endif
  " set number?
" endfunc
" nnoremap <F2> :call HideNumber()<CR>
nnoremap <F2> :set number! number?<CR>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 搜索高亮开关
nnoremap <F4> :set hlsearch! hlsearch?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

set list lcs=tab:\¦\   

if has("autocmd")  " go back to where you exited
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

set completeopt=longest,menu " preview

if has('mouse')
    set mouse=a
    set selectmode=mouse,key
    set nomousehide
endif
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" change the terminal's title
set title
" Smart indent
set smartindent
" 自动对齐
set autoindent
" Remember info about open buffers on close
set viminfo^=%
set modeline
" 突入显示当前行
set cursorline
" 突入显示当前列
set cursorcolumn

" 设置自动对齐空格数
set shiftwidth=4
" 设置Tab宽度
set tabstop=4
" 设置按退格键可以一次删除4个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" 在状态栏显示正在输入的命令
set showcmd
" 设置匹配模式 类似当输入一个左括号时会匹配响应的右括号
set showmatch
set matchtime=0
" 设置取消备份 禁止生成临时文件
set nobackup
" 关闭交换文件
set noswapfile
set nowritebackup
set directory=/tmp/.swapfiles//

if has('nvim')
   set ttimeout
   set ttimeoutlen=0
endif

" 选中并高亮最后一次插入的内容
nnoremap gv `[v`]

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp,ucs-bom
set enc=utf-8
set termencoding=utf-8
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

"按缩进或手动折叠
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldcolumn=0 "设置折叠区域的宽度
set foldlevelstart=200
set foldlevel=200  " disable auto folding
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
vnoremap <Space> zf

" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 搜索时忽略大小写
set ignorecase
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
set autochdir

" 退出 insert mode 并保存
imap jj <Esc>:w<CR>
" 退出 insert mode
imap jj <Esc>

vmap j gj
vmap k gk
nmap j gj
nmap k gk

nmap T :tabnew<cr>

au FileType c,cpp,h,java,css,js,nginx,scala,go inoremap  <buffer>  {<CR> {<CR>}<Esc>O

au BufNewFile *.py call ScriptHeader()
au BufNewFile *.sh call ScriptHeader()

function ScriptHeader()
    if &filetype == 'python'
        let header = "#!/usr/bin/env mdl"
        let cfg = "# vim: ts=4 sw=4 sts=4 expandtab"
    elseif &filetype == 'sh'
        let header = "#!/bin/bash"
    endif
    let line = getline(1)
    if line == header
        return
    endif
    normal m'
    call append(0,header)
    if &filetype == 'python'
        call append(2, cfg)
    endif
    normal ''
endfunction

" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quickly edit/reload the vimrc file
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
" nmap <silent> <leader>sv :so $MYVIMRC<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" --- Plugin Configs ---------
let g:localvimrc_ask=2
let g:localvimrc_sandbox=0

au FileType json setlocal conceallevel=0
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""

" - Tagbar --------------------
let g:tagbar_width = 60
nmap tb :TagbarToggle<cr>  
" -----------------------------

" - Airline -------------------
set noshowmode
set laststatus=2
"let g:airline#extensions#tabline#enabled = 0
"上方显示buffer编号(NUM)，可以使用 NUM CTRL+6 跳转buffer
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 
let g:airline_powerline_fonts = 1
" ----------------------------

" - Neoformat ---------------

let g:neoformat_enabled_python = ['autopep8']
" let g:neoformat_try_formatprg = 1 "Have Neoformat use &formatprg as a formatter
" ----------------------------
"
" - Gutentags ----------------
" show the progress
" set statusline+=%{gutentags#statusline()}
" ----------------------------

" - Deoplete and echodoc
set noshowmode
let g:echodoc#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0
let g:deoplete#enable_smart_case = 1
if has('macunix') " Mac
    let g:deoplete#sources#jedi#python_path = "/usr/local/anaconda3/bin/python3.7"
elseif has('unix') " Linux
    let g:deoplete#sources#jedi#python_path = "/usr/bin/python3.5"
endif
let g:deoplete#sources#jedi#extra_path = split($PYTHONPATH, ":")

let g:deoplete#sources = {}
let g:deoplete#sources.python = ['jedi']

" added from https://hackernoon.com/using-neovim-for-javascript-development-4f07c289d862
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:, 'deoplete#omni#input_patterns', {})
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["- persistent"]
 
inoremap <silent><expr> <C-x><C-o> deoplete#mappings#manual_complete("jedi")
inoremap <expr> <C-o> pumvisible() ? "\<C-n>" : "\<C-o>"
" 使用tab向下查找
inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<tab>"
" ----------------------------

" - NerdTree -----------------
nmap nt :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=0
let NERDTreeMouseMode=2

let NERDTreeWinSize=50
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMinimalUI=0
let NERDTreeDirArrows=1
" ----------------------------
"
" - Nerdcommenter ------------
" 注释符号和字符中间加个空格
let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1

" ----------------------------

" - python and jedi ----------
let python_highlight_all = 1
autocmd BufWritePre *.py :%s/\s\+$//e
au FileType python setlocal cc=80

let g:jedi#force_py_version=3
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>r"
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#usages_command = "<leader>u"
let g:jedi#show_call_signatures_delay = 100
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers="right"
" ----------------------------

" - rainbow_parentheses ------
let g:rbpt_colorpairs = [
	\ [158, '#00ceb3'],
	\ [081, '#00a3ff'],
	\ [214, '#ff8d00'],
	\ [123, '#3fffc9'],
	\ [045, '#29b9ec'],
	\ [190, '#bfec29'],
	\ [208, '#ffad00'],
	\ [117, '#48bde0'],
	\ ]

let g:rbpt_max = 8
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax c,cpp,go,h,java,python,javascript,scala,coffee RainbowParenthesesLoadSquare
au Syntax c,cpp,go,h,java,python,javascript,scala,coffee,scss  RainbowParenthesesLoadBraces
" ----------------------------

" vim-highlightedyank --------
hi HighlightedyankRegion cterm=reverse gui=reverse
" 高亮持续时间为 1000 毫秒
let g:highlightedyank_highlight_duration = 1000 
" ----------------------------

" - ALE ---------------------
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {}

let g:airline#extensions#ale#enabled = 1

" flake8 检查工具需要通过 pip install flake8 安装
let g:ale_linters = {'python': ['flake8'], 'vue': ['eslint', 'vls']}

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_python_flake8_options = "--ignore=E501,F401,E226,E741,E402"
" ---------------------------
"
" - FZF ---------------------
" nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
"----------------------------

" - AG ----------------------
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>A :Ag<CR>
"----------------------------

" Load local config if exists
if filereadable(expand("~/.config/nvim/local.vim"))
	source ~/.vim/config/local.vim
endif

" - delimitMate -------------
" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0
" ---------------------------
