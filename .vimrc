" My ~/.vimrc.
"
" All plugins are now managed using Vundle.
" Plugin management is near the top of the file, configuration near the bottom.

" This must be first, because it changes other options as a side effect.
set nocompatible	" Use Vim defaults (much better!)
filetype off

" Plugin settings
" ======================================================
" Set up Vundle management with the following commands:
" cd ~/.vim/bundle
" git clone https://github.com/VundleVim/Vundle.vim
" ======================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" https://github.com/VundleVim/Vundle.vim.git
Plugin 'VundleVim/Vundle.vim'

" https://github.com/flazz/vim-colorschemes.git
Plugin 'flazz/vim-colorschemes'
" https://github.com/davidhalter/jedi-vim.git
Plugin 'davidhalter/jedi-vim'
" https://github.com/vim-syntastic/syntastic.git
" Plugin 'vim-syntastic/syntastic'
" https://github.com/ervandew/supertab.git
Plugin 'ervandew/supertab'
" https://github.com/scrooloose/nerdtree.git
Plugin 'scrooloose/nerdtree'
" https://github.com/tpope/vim-fugitive.git
Plugin 'tpope/vim-fugitive'
" https://github.com/weynhamz/vim-plugin-minibufexpl.git
Plugin 'weynhamz/vim-plugin-minibufexpl'
" https://github.com/jpflouret/vimp4python.git
" Plugin 'jpflouret/vimp4python'
" https://github.com/luochen1990/rainbow.git
Plugin 'luochen1990/rainbow'
" https://github.com/tmhedberg/matchit.git
Plugin 'tmhedberg/matchit'
" https://github.com/gnattishness/cscope_maps.git
" Plugin 'gnattishness/cscope_maps'
" https://github.com/valloric/youcompleteme.git
" Plugin 'valloric/youcompleteme'
" https://github.com/mileszs/ack.vim.git
Plugin 'mileszs/ack.vim'
" https://github.com/junegunn/fzf.git
Plugin 'junegunn/fzf'
" https://github.com/vim-airline/vim-airline.git
Plugin 'vim-airline/vim-airline'

" https://github.com/rip-rip/clang_complete.git
" Plugin 'rip-rip/clang_complete'

" add new plugins above this line.
call vundle#end()

filetype plugin indent on

source $VIMRUNTIME/defaults.vim

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set backspace=indent,eol,start  " allow backspacing over everything in insert mode

set viminfo='20,\"50  " read/write a .viminfo file, don't store more
                      " than 50 lines of registers

" Other stuff I like
set scrolloff=0
set history=50   " keep 50 lines of command line history
set ruler	       " show the cursor position all the time
set showcmd      " display incomplete commands
set incsearch    " do incremental searching
set foldclose=all
set foldmethod=manual
" set expandtab
" set nosmarttab
set ts=8
set nomodeline
set tags=tags;~/dev
set undolevels=100
set noignorecase
set hls ic
" set shiftwidth=2
set lpl
set splitright

set cindent
set cinoptions=>4,e2,n-2,f0,{2,}0,^-2,:s,=s,l1,b0,gs,hs,ps,ts,is,+4,c3,C0,/0,(2s,us,U1,w1,W0,m0,j0,)20,*30

" Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Don't use Ex mode, use Q for formatting
map Q gq

" Make folding blocks in {} easier
map F zf%
map f zd

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
" set hlsearch
" nnoremap <silent> <esc> :noh<cr><esc>

" Only do this part when compiled with support for autocommands
if has("autocmd")

  autocmd BufEnter * :syntax on

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

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

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

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

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_disable_for_files_larger_than_kb = 10000

" Abbreviations
iab _DATE <C-R>=strftime("Date: %A %B, %e %Y\nTime: %I:%M:%S %p %Z")<CR>

