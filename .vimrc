" -----------------------------------------------------------------------------
" Plugin manager installation
" -----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install on command line: 
" vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
" -----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" Plugins I use - from https://vimawesome.com/
"-----------------------------------------------------------------------------

call plug#begin()
    "Plug 'ctrlpvim/ctrlp.vim'
    "Plug 'itchyny/lightline.vim'
    "Plug 'airblade/vim-gitgutter'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'flazz/vim-colorschemes'
    Plug 'scrooloose/nerdtree'
    Plug 'edkolev/tmuxline.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'lilydjwg/colorizer'
    Plug 'scrooloose/syntastic'
    Plug 'tomasiser/vim-code-dark'
    Plug 'tmsvg/pear-tree'
    "type gc to comment a block whatever the language is
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --bin'}
    Plug 'junegunn/fzf.vim'
    Plug 'ervandew/supertab'
call plug#end()

"-----------------------------------------------------------------------------
" blurry settings that work in differnt contextes
set ttymouse=xterm2
set termguicolors
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set term=screen-256color
    set t_ut=
endif
set t_Co=256
"-----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" Global customizations
"-----------------------------------------------------------------------------
set nocompatible
"syntax enable
autocmd VimResized * wincmd =
set bs=indent,eol,start
let &guicursor = &guicursor . ",a:blinkon0"
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=ucs-bom,utf-8,latin1
endif
set mouse-=a
" wildmenu
set wildmenu
set wildmode=longest:list,full
set textwidth=210

" Slowing down vim - deactivated for now
"set cursorline
"set cursorcolumn
"set colorcolumn=80
"highlight ColorColumn ctermbg=6 guibg=lightgrey

"autocmd InsertEnter * norm zz
let mapleader = "\<Space>"

" Tabs mappings
map t<up>    :tabr<cr>
map t<down>  :tabl<cr>
map t<left>  :tabp<cr>
map t<right> :tabn<cr>
map <Leader>t :tabnew<cr>

nnoremap tn :tabnew<cr>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>

" Panes mappings
" default split to right and below
set splitbelow splitright

map <Leader><right> :vsplit<cr>
map <Leader><down>  :split<cr>

map <Leader>l :vsplit<cr>
map <Leader>k  :split<cr>

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Remap moves between panels
"nnoremap <silent> <C-Right> <c-w>l
"nnoremap <silent> <C-Left> <c-w>h
"nnoremap <silent> <C-Up> <c-w>k
"nnoremap <silent> <C-Down> <c-w>j

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>


" Zoom in and out panes
" noremap <leader>z <c-w>_ \| <c-w>\|
" noremap <leader>o <c-w>=
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

" space-# insert "#" commenting
nnoremap <leader># :norm i#<cr>
vnoremap <leader># :norm i#<cr>
" space-# insert """ commenting
nnoremap <leader>" :norm i"<cr>
vnoremap <leader>" :norm i"<cr>
" Uncommenting
nnoremap <leader>3 :norm ^x<cr>
vnoremap <leader>3 :norm ^x<cr>

" G to go to the end + recenter last line on screen
" When using search - Recenter on screen
nnoremap G Gzz
nnoremap N Nzz
nnoremap n nzz

" Search settings highlight search
" ,<Space> to unhighlight last search
set hlsearch
set incsearch

set hls is
set ignorecase
set smartcase
nnoremap ,<space> :nohlsearch<CR>

"set paste
set pastetoggle=<F2>

"Use indent
set autoindent
set smartindent

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set laststatus=2
set noshowmode
set matchpairs+=<:>
"-----------------------------------------------------------------------------
" Some nice colorscheme
"-----------------------------------------------------------------------------

"colorscheme wombat256
"colorscheme tango
"colorscheme railscasts
"colorscheme vividchalk
"colorscheme distinguished
"colorscheme monokai
"colorscheme molokai
"colorscheme ir_black
"colorscheme neodark
"colorscheme kolor
"colorscheme gotham
"colorscheme jellybeans 
"volorscheme desertEx
"colorscheme skittles_berry
"colorscheme skittles_dark
"colorscheme codeblocks_dark
"colorscheme Monokai 
"colorscheme tender
"colorscheme badwolf
colorscheme gruvbox

set background=dark
let g:gruvbox_contrast_dark = 'hard' 
let g:solarized_termcolors=256

"-----------------------------------------------------------------------------
" Statusline colorscheme - Airline plugin themes
"-----------------------------------------------------------------------------

"let g:airline_theme='dark'
"let g:airline_theme='badwolf'
"let g:airline_theme='ravenpower'
"let g:airline_theme='simple'
"let g:airline_theme='term'
"let g:airline_theme='ubaryd'
"let g:airline_theme='laederon'
"let g:airline_theme='kolor'
"let g:airline_theme='molokai'
"let g:airline_theme = 'gruvbox'
"let g:airline_theme = 'tender'
let g:airline_theme = 'powerlineish'
let g:airline#extensions#whitespace#enabled = 0

"-----------------------------------------------------------------------------
map <C-o> :NERDTreeToggle<CR>

"nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" Open NerdTree in current file folder and toggle


"function! s:NTToggle() abort
function! NTToggle() abort
    if exists('t:ntfind') && t:ntfind
        silent NERDTreeToggle
        silent NERDTreeMirror
        let t:ntfind = 0
    else
        NERDTreeFind
        silent NERDTreeMirror
        let t:ntfind = 1
    endif
endfunction
"command! NTToggle call s:NTToggle()
"nnoremap <silent> <leader>o :NTToggle<CR>
nnoremap <silent> <leader>o NTToggle<CR>

"Initial NERDTree width
let NERDTreeWinSize=30
" Close NERDtree when files was opened
"let NERDTreeQuitOnOpen=1
" Show NERDTree bookmarks
let NERDTreeShowBookmarks=0
" Display arrows instead of ascii art in NERDTree
let NERDTreeDirArrows=1
" Change current working directory based on root directory in NERDTree
let NERDTreeChDirMode=2
" Start NERDTree in minimal UI mode (No help lines)
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

"let g:NERDTreeDirArrowExpandable = '►'
"let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

nnoremap <silent> <leader>d :DiffToggle<CR>
function! s:DiffToggle() abort
    if exists('t:diffing') && t:diffing
        silent windo diffoff
        let t:diffing = 0
    else
        windo diffthis
        let t:diffing = 1
    endif
endfunction
command! DiffToggle call s:DiffToggle()
nnoremap <silent> <leader>d :windo diffthis<CR> 

" Ctrl-n to cycle: show numbers, relative numbers, no numbers
"nnoremap <C-n> :set nu!<CR>
nnoremap <C-n> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" Bubble single lines
"nmap <C-Up> [e
"nmap <C-Down> ]e
"" Bubble multiple lines
"vmap <C-Up> [egv
"vmap <C-Down> ]egv
"

" gO to create a new line below cursor in normal mode
"nmap g<C-A> o<ESC>k
" g<Ctrl+o> to create a new line above cursor (Ctrl to prevent collision with 'go' command)
"nmap ga O<ESC>j

"#map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"#map <Leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
"#map <Leader>s :split <C-R>=expand("%:p:h") . "/" <CR>

" Add a status line on the top
"let g:airline#extensions#tabline#enabled = 1

" Syntastic plugin
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"Ctrl-xo for autocompletion on functions based on file type
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"nmap <C- n> :bn<CR>
"nmap <C- p> :bp<CR>
nmap <Leader>n :bn<CR>
nmap <Leader>p :bp<CR>

"-----------------------------------------------------------------------------
" Murex file extensions mapping
"
autocmd BufNewFile,BufRead *.mxres set syntax=xml
autocmd BufNewFile,BufRead *.app   set syntax=sh

augroup filetypedetect
    " associate *.foo with php filetype
    au BufRead,BufNewFile *.xml.j2   setfiletype xml
    au BufRead,BufNewFile *.mxres.j2 setfiletype xml
    au BufRead,BufNewFile *.properties.j2 setfiletype jproperties
    " Java Properties resource file (note: doesn't catch font.properties.pl)
    au BufNewFile,BufRead *.properties,*.job,*.props,*.props.*,*.properties.*,*.properties_??,*.properties_??_??	setf jproperties
    au BufNewFile,BufRead *.properties_??_??_*	call s:StarSetf('jproperties')
    au BufRead,BufNewFile *.properties.j2 setfiletype jproperties
augroup END

nnoremap <silent> <F8> :ThemeToggle<CR>
function! s:ThemeToggle() abort
    if exists('t:darktheme') && t:darktheme
        silent colorscheme gruvbox
        set background=dark
        let t:darktheme = 0
    else
        silent colorscheme pencil
        set background=light
        let t:darktheme = 1
    endif
endfunction
command! ThemeToggle call s:ThemeToggle()

"hi TabLineFill ctermfg=LightGreen ctermbg=white
"hi TabLine ctermfg=Blue ctermbg=white
"hi TabLineSel ctermfg=Red ctermbg=white
"hi Title ctermfg=LightBlue ctermbg=white
hi TabLine      gui=none ctermfg=000 ctermbg=238 cterm=none
hi TabLineSel   gui=bold ctermfg=000 ctermbg=235 cterm=bold
hi TabLineFill  gui=none ctermfg=000 ctermbg=238 cterm=none


"set clipboard=unnamed
"set clipboard=unnamedplus

map <silent><Leader>tt :vertical terminal<CR>
"nnoremap <silent> ,t :vsplit<CR><C-w>w:terminal<CR><C-w>w:q!<CR>

"Pear Tree plugin automatically close (, {, [ and quote pairs whilst in insert mode.
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace   = 1
let g:pear_tree_smart_closers     = 1
let g:pear_tree_smart_openers     = 1

" Easy Align plugin
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Substitute the word under the cursor.
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Enable code folding for CoffeeScript
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

autocmd BufNewFile,BufReadPost *.js setl foldmethod=indent
autocmd BufNewFile,BufReadPost *.json setl foldmethod=indent
autocmd BufNewFile,BufReadPost *.xml setl foldmethod=indent
autocmd BufNewFile,BufReadPost *.sh setl foldmethod=indent



" Don't fold automatically https://stackoverflow.com/a/8316817
au BufRead * normal zR

setl foldmethod=syntax
setl foldmethod=syntax

" Enable code folding for CoffeeScript
autocmd BufNewFile,BufReadPost *.txt setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.sh setl foldmethod=indent
autocmd BufNewFile,BufReadPost *.xml setl foldmethod=indent

setl foldmethod=syntax
" Don't fold automatically https://stackoverflow.com/a/8316817
au BufRead * normal zR

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap b<right> :bnext<CR>
nnoremap b<left> :bprevious<CR>

