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

Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/syntastic'

filetype plugin indent on     " required!

" ===========
" syntastic
" ===========
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }

" ===========
" MiniBufExplorer
" ===========
let g:miniBufExplMapCTabSwitchBufs = 1
" 用<C-h,j,k,l>切换到上下左右的窗口中去
"let g:miniBufExplMapWindowNavVim = 1
" 用<C-箭头键>切换到上下左右窗口中去
"let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplModSelTarget = 1

" ===========
" PowerLine
" ===========
" 要set laststatus=2，fancy样式要装特殊字体
let g:Powerline_symbols = 'fancy'

" ===========
" neocomplcache
" ===========
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup=1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" 设置NeoComplCache不自动弹出补全列表
let g:neocomplcache_disable_auto_complete=1
" 启动快速匹配
let g:NeoComplCache_Enable_Quick_Match=1

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

let g:neocomplcache_enable_auto_select = 1

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" ==========
" neosnippet
" ==========
let g:snips_author='Gw.Huangsir'

" ==========
" Tlist
" ==========
" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File=1
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow=1
"  taglist只显示当前文件tag
let Tlist_File_Fold_Auto_Close=1
" 在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window=1
" 快捷键打开taglist
map <F4> :Tlist<cr>

" ==========
" NERDTree
" ==========
" NERDTree可以ReFlash，要设置set modifiable
map <F2> :NERDTreeToggle<cr>
:let NERDTreeIgnore=['\.orig$', '\~$']

" ==========
" CtrlP
" ==========
map <F3> :CtrlP ~/www/gitgateway/<cr>

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
set textwidth=80

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

" 总是显示状态栏2（这个选项会影响powerline发挥）
set laststatus=2

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
    set guifont=Monaco\ 10
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
" 编码自动补全
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

" php语法检查
function! PhpCheckSyntax()
  " Check php syntax
  setlocal makeprg=\php\ -l\ -n\ -d\ html_errors=off\ %

  " Set shellpipe
  setlocal shellpipe=>

  " Use error format for parsing PHP error output
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l
  make %
endfunction

" 设置快捷键。Perform :PhpCheckSyntax()
map <F6> :call PhpCheckSyntax()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")

  " 自动检测文件类型并加载相应的设置
  filetype plugin indent on

  " Python 文件的一般设置，比如不要 tab 等
  autocmd FileType python setlocal et | setlocal sta | setlocal sw=4

  " Python Unittest 的一些设置
  " 可以让我们在编写 Python 代码及 unittest 测试时不需要离开 vim
  " 键入 :make 或者点击 gvim 工具条上的 make 按钮就自动执行测试用例
  "autocmd FileType python compiler pyunit
  "autocmd FileType python setlocal makeprg=python\ ./alltests.py
  "autocmd BufNewFile,BufRead test*.py setlocal makeprg=python\ %

endif

" python auto-complete code
" Typing the following (in insert mode):
"   os.lis<Ctrl-n>
" will expand to:
"   os.listdir(
" Python 自动补全功能，只需要反覆按 Ctrl-N 就行了
if has("autocmd")
  autocmd FileType python set complete+=k~/.vim/tools/pydiction
endif

" Python syntax setting
let python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GoLang支持
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Go lang
au BufNewFile,BufRead *.go set filetype=go
" php & html
au BufNewFile,BufRead *.tpl set filetype=html
au BufNewFile,BufRead *.ctp set filetype=php
"au BufNewFile,BufRead *.html set filetype=jinja
au BufRead,BufNewFile *.css set ft=css syntax=css3
au BufRead,BufNewFile *.json set filetype=json
au BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"

"======================================================
"HTML标签补全
"======================================================

function! InsertHtmlTag()
  let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
  normal! a>
  let save_cursor = getpos('.')
  let result = matchstr(getline(save_cursor[1]), pat)
  "if (search(pat, 'b', save_cursor[1]) && searchpair('<','','>', 'bn',0,getline('.')) > 0)
  if (search(pat, 'b', save_cursor[1]))
    normal! lyiwf>
    normal! a</
    normal! p
    normal! a>
  endif
  :call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
endfunction
inoremap > <ESC>:call InsertHtmlTag()<CR>a

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

