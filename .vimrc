" My ~/.vimrc.
"
" All plugins are now managed using Vundle.
" Plugin management is at the top of the file, configuration is at the bottom.
"
"
" Get the defaults that most users want.

set nocompatible	" Use Vim defaults (much better!)
filetype off

" Plugin settings
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" jedi-vim  nerdtree  supertab  syntastic  vim-colorschemes  vim-fugitive  vim-plugin-minibufexpl  Vundle.vim  youcompleteme

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'weynhamz/vim-plugin-minibufexpl'
Plugin 'jpflouret/vimp4python'
Plugin 'luochen1990/rainbow'
Plugin 'tmhedberg/matchit'
Plugin 'gnattishness/cscope_maps'


" Plugin 'rip-rip/clang_complete'
" Plugin 'powerline/powerline'
" Plugin 'valloric/youcompleteme'


" add new plugins above this line.
call vundle#end()

filetype plugin indent on

source $VIMRUNTIME/defaults.vim

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
"if has('persistent_undo')
"  set undofile	" keep an undo file (undo changes after closing)
"endif
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers

" Other stuff I like
set scrolloff=0
set foldclose=all
set foldmethod=manual
set expandtab
set nosmarttab
set ts=2
set nomodeline
set tags=tags;~/dev
set undolevels=100
set noignorecase
set hls ic
set shiftwidth=2
set lpl
" set splitright

" Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Don't use Ex mode, use Q for formatting
map Q gq

" Make folding blocks in {} easier
map F zf%

imap  
lmap  
cmap  

" Set the color range and colorscheme
set t_Co=256
colorscheme lou
set background=dark
" Switch syntax highlighting on
syntax on
" Also switch on highlighting the last used search pattern.
set hlsearch

" Only do this part when compiled with support for autocommands
if has("autocmd")

  autocmd BufEnter * :syntax on

  augroup fedora
  autocmd!

  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=80

  augroup END
endif

"if has("cscope") && filereadable("/usr/bin/cscope")
"   set csprg=/bin/cscope
"   set csto=0
"   set cst
"   set nocsverb
   " add any database in current directory
  " if filereadable("cscope.out")
  "    cs add $PWD/cscope.out
  " " else add database pointed to by environment
  " elseif $CSCOPE_DB != ""
  "    cs add $CSCOPE_DB
  " endif
"   set csverb
"endif

" filetype plugin on

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" Add optional packages.
"
" ===================================
" Plugin configs below this point.

" NERDTree - awesome filesystem interface
nnoremap <silent> <F7> :NERDTreeToggle<CR>

" Settings for taglist.vim
nnoremap <silent> <F8> :TlistToggle<CR>
" let Tlist_Use_Right_Window=1
" let Tlist_Auto_Open=1
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1

" ===================================
" Plugin config: CVS???
" nmap L :VCSLog<CR>
" nmap A :VCSAnnotate<CR>
" nmap S :VCSStatus<CR>
" nmap U :VCSUpdate<CR>
" nmap V :VCSVimDiff<CR>
" nmap D :VCSDiff<CR>

" ===================================
" Plugin config: MiniBufExplorer
" Prevent the buffer explorer window from
" opening until we open at least 4 buffers.
" Default is 2.
let g:miniBufExplBuffersNeeded = 4
" <F6> Opens or closes the buffer explorer window.
noremap <silent> <F6> :MBEToggle<CR>
" Available commands: MBEToggle  MBEToggleAll  MBEToggleMRU  MBEToggleMRUAll

" scrolling through the open buffers.
nnoremap <silent> <F2> :MBEbp<CR>
nnoremap <silent> <F3> :MBEbn<CR>
hi MBEChanged guibg=darkblue ctermbg=darkblue


" ===================================
" Plugin config: Rainbow Parens
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
  let g:rainbow_conf = {
  \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \ 'ctermfgs': ['blue', 'yellow', 'magenta', 'cyan', 'green'],
  \ 'operators': '_,_',
  \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \ 'separately': {
  \   '*': {},
  \   'tex': {
  \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \   },
  \   'lisp': {
  \     'guifgs': ['navyblue', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  \   },
  \   'vim': {
  \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \   },
  \   'html': {
  \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
  \   },
  \   'css': 0,
  \ }
  \}
nnoremap <silent> <F9> :RainbowToggle<CR>



" Abbreviations
iab _DATE <C-R>=strftime("Date: %A %B, %e %Y\nTime: %I:%M:%S %p %Z")<CR>

