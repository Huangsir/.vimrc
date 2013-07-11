" 我的VIM配置
" @author Huangsir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc() " 使用:BundleInstall安装插件
Bundle 'gmarik/vundle'
"Bundle 'scrooloose/nerdtree'
"Bundle 'ervandew/supertab'
"Bundle 'msanders/snipmate.vim'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neosnippet'

" 快速查找文件的神器，快捷键C-p
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
" 特定项目
map <F3> :CtrlP ~/www/gitgateway/<cr>

" 配色样式
Bundle 'altercation/vim-colors-solarized'

" 同时修改多个东西的神器
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_start_key='<F7>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-N>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"下面那条状态栏，需要特殊的字体支持
Bundle 'Lokaltog/vim-powerline'
" 状态栏要两行
set laststatus=2 
let g:Powerline_symbols = 'fancy'

" 快速注释插件；快捷键 <leader>cc  <leader>cu
Bundle 'scrooloose/nerdcommenter'

" 神一样的不全工具，可以取代clang_complete, AutoComplPop, Supertab, neocomplcache
Bundle 'Valloric/YouCompleteMe'
let g:ycm_min_num_of_chars_for_completion = 3

" 大文件分割，可以加快vim的速度
Bundle 'vim-scripts/LargeFile'

" python工具集合，python-mode自带pep8检查，需要放在syntastic前面
Bundle 'klen/python-mode'
let g:pymode_run_key = '<leader><C-R>'
" Map keys for autocompletion
let g:pymode_lint_ignore = "E501,C901,W0611"
" Disable python folding
let g:pymode_folding = 0
" Key for show python documentation
let g:pymode_doc_key = '<leader>k'

" 语法检查，需要放在python-mode后面以免冲突
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }

" toml & yaml 高亮
Bundle 'cespare/vim-toml'
Bundle 'ingydotnet/yaml-vim'

" javascript语法
Bundle 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" 快速补全代码；
Bundle 'vim-scripts/UltiSnips'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"快速添加环绕符号；快捷键： ysiw' yss' vS' ds' cs'(
Bundle 'tpope/vim-surround'

" 缩进标识
Bundle 'Yggdroot/indentLine'

"更高效的移动 '' + w/fx
Bundle 'Lokaltog/vim-easymotion'

" 注释神器，快捷键 + & -
Bundle 'terryma/vim-expand-region'

" 括号着色
Bundle 'kien/rainbow_parentheses.vim'
" Always On
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" required!
filetype plugin indent on

" MiniBufExplorer；wj, wk, wh, wl 切换标签
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 历史记录数
set history=700

" 自动缩进
set autoindent
" c语言模式缩进
set cindent
"复制之前缩进
set copyindent
" 为C程序提供自动缩进
set smartindent

" 当文件从外部被更改时自动重新载入
set autoread

" 自动设当前编辑的文件所在目录为当前工作路径
set autochdir

" 各种编码
set enc=utf-8
set fenc=utf-8
set encoding=utf-8

" 光标靠近边缘上下1行时自动滚动
set so=1

" 增强模式中的命令行自动完成操作
set wildmenu

" 换行不截断单词
set linebreak

" Tab as space
set expandtab

" Tab=4个字符
set ts=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 每行字符数
set textwidth=200

" 用语法高亮来定义折叠
set foldmethod=marker

" 开启自动换行
set wrap

" 不进行缩进的文件名
set wildignore=*.o,*~,*.pyc

" 显示标尺
set ruler

" 显示行号
set number

" 命令行高度1行
set cmdheight=1

" 总是显示标签栏
set showtabline=0

" tab标签的最大个数
set tabpagemax=0

" 允许在有未保存的修改时切换缓冲区，此时的修改由切换由 vim 负责保存
"set hid

" 不设定的话在插入状态无法用退格键和 Delete
set backspace=eol,start,indent

" 当广告到行尾或行首时自动换行
" set whichwrap+=<,>,h,l

" 查找时不区分大小写
set ignorecase
" 但在有一个或以上大写字母时,仍保持对大小写敏感
set smartcase

" 高亮搜索结果
set hlsearch

" 高亮搜索关键字
set incsearch

" 当运行宏时，不重绘
" set lazyredraw

" 除了 $ . * ^ 之外其他元字符都要加反斜杠。
set magic

" 插入括号时暂时跳转到和他匹配的括号
set showmatch
" 跳转1秒
set matchtime=1

" 会影响NerdTree发挥
set modifiable

" 整个世界清净了
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启用高亮
syntax enable

" 根据文件类型高亮
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 自动补全补充
set completeopt=longest,menu

" 高亮配置
set background=dark
colorscheme solarized

" 字体设置
if has("win32")
    set guifont=Courier_New:h9:cANSI
    au GUIEnter * simalt ~x
elseif has("mac") || has("macunix")
    set guifont=Monaco:h14
    set runtimepath+=~/Workspace/vim/php-manual
    set runtimepath+=~/go/misc/vim
else
    "set guifont=Liberation\ Mono\ 9
    "set guifont=Droid\ Sans\ Mono\ 9
    "set guifont=Consolas\ 9
    set guifont=Monaco\ 9
    "set guifont=Dejavu\ Sans\ Mono\ 9
    set langmenu=zh_CN.utf-8
    set enc=utf-8
    set guifontwide=
endif

" Gvim下隐藏各种菜单栏
if has("gui_running")
    " 隐藏工具栏
    set guioptions=
    " 高亮光标所在行 -- Linux下会降低性能
    " set cursorline
endif

au BufNewFile,BufRead *.go set filetype=go
" php & html
au BufNewFile,BufRead *.tpl set filetype=html
au BufNewFile,BufRead *.ctp set filetype=php
"au BufNewFile,BufRead *.html set filetype=jinja
au BufRead,BufNewFile *.css set ft=css syntax=css3
au BufRead,BufNewFile *.json set filetype=json
au BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 分割窗口
map ws :split<cr>
map wv :vsplit<cr>

" 关闭窗口
map wc :close<cr>

" 切换分割窗口
map wn <C-w>w

" 将所选中内容复制到系统
map cy "+y

" 模仿MS Windows中的快捷键
vmap <C-c> "+y
vmap <C-x> "+x
nmap <C-v> "+p
vmap <C-v> "+p
nmap <C-a> ggvG$

" 用<C-h,j,k,l>切换到上下左右的窗口中去
nmap <A-j> <C-W>j
nmap <A-k> <C-W>k
nmap <A-h> <C-W>h
nmap <A-l> <C-W>l

nmap wj <C-W>j
nmap wk <C-W>k
nmap wh <C-W>h
nmap wl <C-W>l

" 模仿MS Windows中的保存命令: Ctrl+S
imap <C-s> <Esc>:wa<cr>i<Right>
nmap <C-s> :wa<cr>

" Ctrl+u撤销
vmap <C-u> :u<cr>
nmap <C-u> :u<cr>

" 快捷键命令
let mapleader = "'"
let g:mapleader = "'"

""""""""""""""""""""""""""""""
" Visual mode related
""""""""""""""""""""""""""""""
:vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 括号自动补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END

    " 自动补全符号
    function! AutoClose()
        :inoremap ( ()<ESC>i
        :inoremap " ""<ESC>i
        :inoremap ' ''<ESC>i
        :inoremap ` ``<ESC>i
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
    endf

    function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf

    " to close for PHP and Javascript script
    au FileType go,php,c,python,javascript exe AutoClose()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Php支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" php代码折叠，会影响性能
let php_folding = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")

  " 自动检测文件类型并加载相应的设置
  filetype plugin indent on

  " Python 文件的一般设置，比如不要 tab 等
  autocmd FileType python setlocal et | setlocal sta | setlocal sw=4

endif

" Python syntax setting
let python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GoLang支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" go fmt
function! GolangFmt()
  " Check php syntax
  setlocal makeprg=\go\ fmt
  " Set shellpipe
  setlocal shellpipe=>
  " Use error format for parsing PHP error output
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l
  make %
endfunction
map <F6> :call GolangFmt()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 非正常文件语法高亮支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " CakePHP
  autocmd BufNewFile,BufRead *.ctp setfile php
  ""autocmd BufNewFile,BufRead *.ctp setfile html
endif

"ActionScript和Mxml
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.as set filetype=actionscript

"Makefile的Tab支持
autocmd BufEnter ?akefile* set noet ts=2 sts=2 sw=2

