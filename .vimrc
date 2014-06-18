" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

runtime ~/.vim
call pathogen#infect()
colorscheme lou
syntax enable

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set foldclose=all
set foldmethod=manual
set t_Co=256

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


set expandtab
set nosmarttab
set ts=8
set nomodeline
set tags=tags,./tags,./../tags,./../../tags,./../../../tags
set undolevels=100
set incsearch
set hlsearch
set noignorecase
set hls ic
set cindent
set shiftwidth=2
set lpl

" default cinoptions:
" set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,l0,gs,hs,ps,ts,+s,c3,C0,(2s,us,U0,w0,m0,j0,)20,*30
set cinoptions=>4,e2,n-2,f0,{2,}0,^-2,:s,=s,l1,b0,gs,hs,ps,ts,is,+4,c3,C0,/0,(2s,us,U1,w1,W0,m0,j0,)20,*30

" Make it easier rotating through screens when split
" map v w

" Don't use Ex mode, use Q for formatting
map Q gq

" Make folding blocks in {} easier
map F zf%

imap  
lmap  
cmap  

" NERDTree - awesome filesystem interface
nnoremap <silent> <F7> :NERDTreeToggle<CR>

" Settings for taglist.vim
nnoremap <silent> <F8> :TlistToggle<CR>
" let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1

" Turned these off for now - Syntastic is a bit over-zealous
" Don't let Syntastic harp on style
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_enable_balloons = 1
" let g:syntastic_auto_jump = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_quiet_messages = { "type": "style" }

" Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Prevent the buffer explorer window from
" opening until we open at least 4 buffers.
" Default is 2.
" let g:miniBufExplorerMoreThanOne=4

" Allow <C-TAB>/<C-S-TAB> and <F2>/<F3>
" scrolling through the open buffers.
let g:miniBufExplMapCTabSwitchBufs=1

" <F6> Opens or closes the buffer explorer window.
map <unique> <F6> <Plug>TMiniBufExplorer

" nnoremap <silent> <F9> :RainbowParenthesesToggleAll<CR>
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" Abbreviations
iab _DATE <C-R>=strftime("Date: %A %B, %e %Y\nTime: %I:%M:%S %p %Z")<CR>

