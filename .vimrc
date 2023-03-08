call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'Valloric/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'vim-scripts/taglist.vim'
Plug 'Chiel92/vim-autoformat'
" Plug 'rakr/vim-one'

call plug#end()

set guifont=Fira\ Code:style=Bold

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " Allow backspacing over everything in insert mode
set ai                  " Always set auto-indenting on
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time
set nu           "在左侧行号
set expandtab
set shiftwidth=4
set tabstop=4      "tab 长度设置为 4
set nobackup     "覆盖文件时不备份
set cursorline   "突出显示当前行
set ruler        "在右下角显示光标位置的状态行
set autoindent   "自动缩进
set backspace=indent,eol,start " 使退格键在行首时退格到上一行行尾
set hlsearch " 高亮搜索结果
set mouse=r
noremap <LEADER><CR> :nohlsearch<CR> " 按下\回车将会取消搜索的高亮显示

set fileencoding=utf-8

" Don't use Ex mode, use Q for formatting
map Q gq

" When doing tab completion, give the following files lower priority.
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo

set nomodeline
syntax on
autocmd BufRead APKBUILD set filetype=sh

if filereadable("/etc/vim/vimrc.local")
        source /etc/vim/vimrc.local
endif
set encoding=utf-8
set termencoding=utf-8
set noswapfile

" 使匹配的尖括号高亮
set mps+=<:>


" 设置主题

" colorscheme one

" set background=dark

" set guifont=FiraCode-Light

" for YCM
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

let g:ycm_confirm_extra_conf = 0
set runtimepath+=~/.vim/plugged/YouCompleteMe/
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
" let g:ycm_key_list_select_completion = ['&lt;c-n&gt;', '&lt;Down&gt;']  " 映射按键, 没有这个会拦截掉tab, 导致其他插件 的tab不能用.
let g:ycm_key_list_previous_completion = ['&lt;c-p&gt;', '&lt;Up&gt;']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
" 语义补全
let g:ycm_semantic_triggers =  {
                        \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                        \ 'cs,lua,javascript': ['re!\w{2}'],
                        \ }
" 关闭YCM的函数原型功能
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" 补全提示框的颜色
highlight PMenu ctermfg=3 ctermbg=4 guifg=Grey guibg=darkgrey
highlight PMenuSel ctermfg=1 ctermbg=7 guifg=darkgrey guibg=black

" inoremap &lt;expr&gt; &lt;CR&gt; pumvisible() ? "\&lt;C-y&gt;" : "\&lt;CR&gt;" |            " 回车即选中当前项
" nnoremap &lt;c-j&gt; :YcmCompleter GoToDefinitionElseDeclaration&lt;CR&gt;|     " 跳转到定义处
" let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

inoremap <C-Q> <Esc>:wq<CR>
inoremap <C-B> <Esc>:undo<CR>:startinsert<CR>
inoremap <C-R> <Esc>:redo<CR>:startinsert<CR>
nnoremap <F2> :set nu! nu?<CR>
nnoremap <F4> :set wrap! wrap?<CR>
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-s> :w<CR>
map <PageUp> gT
map <PageDown> gt
set textwidth=50

" for nerdtree
autocmd StdinReadPre * let s:std_in=1 autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd VimEnter * cd %:p:h



" for nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif


" for format
" 指定formatter的路径
let g:formatterpath = ['/usr/bin/clang-format-15']
" 禁用vim自带的格式化
let g:autoformat_autoindent = 0
let g:autoformat_verbosemode=1

" for taglist
let Tlist_Show_One_File = 1                    "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1                  "如果taglist窗口是最后一个窗口，则退出vim
map <silent> <F9> :TlistToggle<cr>             "按F9等同于在命令行模式输入:TlistToggle

" for gtags
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
let gtags_file=findfile("GTAGS", ";") "查找 gtags 文件
if !empty(gtags_file)
    exe "cs add" gtags_file
endif
:set cscopequickfix=s+,c+,d+,i+,t+,e+
