

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PlugList                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/vimfiles/autoload')
" Make sure you use single quotes
"

Plug 'vim-airline/vim-airline'

Plug 'Valloric/YouCompleteMe'

Plug 'jiangmiao/auto-pairs'

Plug 'pangloss/vim-javascript'

"
" :Tab /+target to make alignment, /+target\zs to exclude the target charater from the search match
Plug 'godlygeek/tabular'

" \s+target to jump
Plug 'easymotion/vim-easymotion'

" jshint
Plug 'NikolayFrantsev/jshint2.vim'

" F8 to start markdown preview(MarkdownPreview), F9 to
" stop(MarkdownPreviewStop)
"
" pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" yarn & node
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6' | Plug 'mxw/vim-jsx'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"comments-auto
Plug 'scrooloose/nerdcommenter'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
"theme color
Plug 'tomasr/molokai' | Plug 'altercation/solarized'
Plug 'dracula/vim'

"Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'

"multiple selections
Plug 'terryma/vim-multiple-cursors'

"Highlights trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

"emmet quick-html
Plug 'mattn/emmet-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              plugin settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
map <Leader> <f>(easymotion-prefix)
"markdown preview
nmap <silent> <F8> <Plug>MarkdownPreview
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
nmap <silent> <F9> <Plug>StopMarkdownPreview
" for insert mode
imap <silent> <F9> <Plug>StopMarkdownPreview
" set to 1, the nvim will open the preview window once enter the markdown buffer
let g:mkdp_auto_start = 0
" set to 1, preview server available to others in your network by default, the server only listens on localhost (127.0.0.1)
let g:mkdp_open_to_the_world = 1
" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = 'markdown.css'


"jshint2
let jshint2_command    = 'C:/Users/dixonqin/AppData/Roaming/npm/jshint'
let jshint2_close      = 0
let jshint2_color      = 0
let jshint2_min_height = 3
let jshint2_max_height = 12
let jshint2_save       = 0

let g:python3_host_prog='C:/Program Files/Python36'

set nocompatible

let mapleader=";"

" Initialize plugin system
call plug#end()



"ctrlp ####
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'


"nerdcommenter ####
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

"vim-easy-align ####
xmap ga <e>(EasyAlign)
nmap ga <e>(EasyAlign)

"vim-jsx ####
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               common setting                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " 启动最大化
if has('gui_running')
    au GUIEnter * simalt ~x
endif

colorscheme dracula
set number
" 高亮当前行
set cursorline

filetype plugin indent on
set autoindent
set smartindent
set showmatch
set ignorecase

set incsearch

set display+=lastline

"关闭滚动条、工具栏、菜单栏
set guioptions-=r
set guioptions-=L
set guioptions-=b
set guioptions-=T
set guioptions-=m

"当vim编辑错误时，不会发出响声
set vb t_vb=

set mouse=a

set guifont=Consolas-with-Yahei:h12:cANSI

set tabstop=4
set shiftwidth=4
set expandtab

set wrap
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,h,l,<,>,[,]
set nobomb
set backspace=indent,eol
" set clipboard+=unnamed

set clipboard=unnamed

set winaltkeys=no

set undofile " keep an undo file (undo changes after closing)

set ruler  " show the cursor position all the time

set showcmd " display incomplete commands

set cmdheight=1 " 1 screen lines to use for the command-line

set showfulltag " show tag with function protype.

set fileencodings=utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=gbk

syntax on
syntax enable

set autoread

set hlsearch

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               keyboard-binding                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NerdTree ####
map <C-t> :NERDTreeToggle<CR>
"ultisnip ####
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

nmap <leader>s :update<CR>
vmap <leader>s :update<CR>
inoremap <C-BS> <Esc>bdei
nnoremap <C-left> :bn<CR>
nnoremap <C-right> :bp<CR>

nnoremap <leader>a ^
vnoremap <leader>a ^ inoremap <leader>a ^
nnoremap <leader>n $
vnoremap <leader>n $ inoremap <leader>n $

nmap <leader>tn :tabnew<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>th :tabp<cr>
nmap <leader>tl :tabn<cr>
" 移动分割窗口
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
" 正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <M-j> :resize +5<cr>
nnoremap <M-k> :resize -5<cr>
nnoremap <M-h> :vertical resize -5<cr>
nnoremap <M-l> :vertical resize +5<cr>

 " 插入模式移动光标 alt + 方向键
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>
 " Don't use Ex mode, use Q for formatting
noremap Q gq
