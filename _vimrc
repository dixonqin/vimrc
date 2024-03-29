

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PlugList                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/vimfiles/autoload')
" Make sure you use single quotes
"
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }

Plug 'chemzqm/wxapp.vim'
"language highlight
Plug 'sheerun/vim-polyglot'

"start screen
Plug 'mhinz/vim-startify'

"show keybidings
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

"org mode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'Valloric/YouCompleteMe'
" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'

Plug 'pangloss/vim-javascript'

"
" :Tab /+target to make alignment, /+target\zs to exclude the target charater from the search match
Plug 'godlygeek/tabular'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'


" \s+target to jump
Plug 'easymotion/vim-easymotion'

" jshint
Plug 'NikolayFrantsev/jshint2.vim'

" F8 to start markdown preview(MarkdownPreview), F9 to
" stop(MarkdownPreviewStop)
"
" pre build
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" yarn & node
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" ultisnips
Plug 'SirVer/ultisnips'
" Multiple Plug commands can be written in a single line using | separators
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6' | Plug 'mxw/vim-jsx'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"comments-auto
Plug 'scrooloose/nerdcommenter'

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
"theme color
Plug 'tomasr/molokai' | Plug 'altercation/solarized'
Plug 'dracula/vim'

"Fuzzy file, buffer, mru, tag, etc finder.
"Plug 'kien/ctrlp.vim'

"multiple selections
Plug 'mg979/vim-visual-multi'

"Highlights trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

"emmet quick-html
Plug 'mattn/emmet-vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              plugin settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" coc-config  get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" leaderF
let g:Lf_ShortcutF = '<C-P>'

"startify settings
let g:startify_bookmarks=[{'s':'~\_vimrc'}, {'n':'~\dixon\notes\quickNotes.org'}]
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

" coc.vim settings
" if hidden is not set, TextEdit might fail.
set hidden
" always show signcolumns
set signcolumn=yes
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Better display for messages
set cmdheight=2
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" don't give |ins-completion-menu| messages.
set shortmess+=c

" if the completion show press <tab> to select completion, else press <tab>
" just <tab>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }


"coc.vim settings encoding


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"markdown preview
let g:mkdp_browser = 'chrome'
" use a custom port to start server or random for empty
let g:mkdp_port = '12345'
" set to 1, the nvim will open the preview window once enter the markdown buffer
let g:mkdp_auto_start = 1
" set to 1, preview server available to others in your network by default, the server only listens on localhost (127.0.0.1)
let g:mkdp_open_to_the_world = 1
" use a custom markdown style must be absolute path
"let g:mkdp_markdown_css = 'markdown.css'


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
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

"nerdcommenter ####
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
let NERDTreeBookmarksFile=''

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
set foldenable

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
set backspace=indent,eol,start
set clipboard+=unnamed

set winaltkeys=no

set undofile " keep an undo file (undo changes after closing)

set ruler  " show the cursor position all the time

set showcmd " display incomplete commands

set cmdheight=1 " 1 screen lines to use for the command-line

set showfulltag " show tag with function protype.

set fileencodings=utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=utf-8

syntax on
syntax enable

set autoread

set hlsearch

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               keyboard-binding                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"NerdTree ####
map <C-t> :NERDTreeToggle<CR>

nmap <leader>s :update<CR>
vmap <leader>s :update<CR>
nnoremap <C-left> :bn<CR>
nnoremap <C-right> :bp<CR>

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

