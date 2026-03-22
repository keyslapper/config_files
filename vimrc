set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" source ~/.vimrc

" This must be first, because it changes other options as a side effect.
set nocompatible          " Use Vim defaults (much better!)

" Plugin settings ====================================== {{{
filetype off " must be off before we set up plugins

" ========================================================
" Set up vim-plug management with the following command:
" ========================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" ========================================================
" Vim will only continue after the above command finishes.
" ========================================================

call plug#begin('~/.vim/plugged')

" https://github.com/vim-scripts/YankRing.vim.git
" Plug 'vim-scripts/YankRing.vim'
" https://github.com/vim-syntastic/syntastic.git
" Plug 'vim-syntastic/syntastic'
" https://github.com/gnattishness/cscope_maps.git
" Plug 'gnattishness/cscope_maps'
" https://github.com/valloric/youcompleteme.git
" Plug 'valloric/youcompleteme'
" https://github.com/junegunn/vim-slash.git
" Plug 'junegunn/vim-slash'
" https://github.com/rakr/vim-one.git
" Plug 'rakr/vim-one'
" https://github.com/rip-rip/clang_complete.git
" Plug 'rip-rip/clang_complete'
" https://github.com/tmhedberg/matchit.git
" Plug 'tmhedberg/matchit'
" https://github.com/mileszs/ack.vim.git
" Plug 'mileszs/ack.vim'
" https://github.com/junegunn/fzf.vim.git
" Plug 'junegunn/fzf.vim'
" https://github.com/junegunn/gv.vim.git
" Plug 'junegunn/gv.vim'
" https://github.com/vim-scripts/taglist.vim.git
" Plug 'vim-scripts/taglist.vim'
" https://github.com/weynhamz/vim-plugin-minibufexpl.git
Plug 'weynhamz/vim-plugin-minibufexpl'
" https://github.com/junegunn/vim-plug
Plug 'junegunn/vim-plug'
" https://github.com/flazz/vim-colorschemes.git
Plug 'flazz/vim-colorschemes'
" https://github.com/vim-scripts/ScrollColors.git
Plug 'vim-scripts/ScrollColors'
" https://github.com/davidhalter/jedi-vim.git
"Plug 'davidhalter/jedi-vim'
" https://github.com/ervandew/supertab.git
"Plug 'ervandew/supertab'
" https://github.com/preservim/nerdtree.git
Plug 'preservim/nerdtree'
" http://github.com/preservim/nerdcommenter.git
"Plug 'preservim/nerdcommenter'
" https://github.com/airblade/vim-gitgutter.git
Plug  'airblade/vim-gitgutter'
" https://github.com/tpope/vim-fugitive.git
Plug 'tpope/vim-fugitive'

" https://github.com/tpope/vim-surround.git
"Plug 'tpope/vim-surround'
" https://github.com/tpope/vim-repeat.git
Plug 'tpope/vim-repeat'
" https://github.com/luochen1990/rainbow.git
Plug 'luochen1990/rainbow'
" https://github.com/vim-airline/vim-airline.git
"Plug 'vim-airline/vim-airline'
" https://github.com/vim-airline/vim-airline-themes.git
"Plug 'vim-airline/vim-airline-themes'
" https://github.com/python-mode/python-mode.git
" Plug 'python-mode/python-mode.git'
" https://github.com/inside/vim-search-pulse.git
"Plug 'inside/vim-search-pulse'

" Set up under .vim/pack/
" https://github.com/features/copilot
" Plug 'github/copilot'

" add new plugins above this line.
""""""""""""""""""""""""""""""""""

call plug#end()

filetype plugin indent on

" ====================================================== }}}

" Basic options ======================================== {{{
set autoindent            " always set autoindenting on
set smartindent           " always set autoindenting on
set showmode              " always show what mode we're currently editing in
set showcmd               " display incomplete commands
set showmatch             " set show matching parenthesis
set ignorecase            " ignore case when searching
set smartcase             " ignore case if search pattern is all lowercase,
set mouse=a               " enable mouse clicks
set mouse=v               " middle-click paste
set hlsearch              " highlight searching
set incsearch             " do incremental searching
"set tabstop=8             " number of columns occupied by a tab
set softtabstop=2         " See multiple spaces as tabstops so <BS> does the right thing.
set noshiftround          " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2          " Width for autoindents
set expandtab             " Tabs are evil.  Convert them to spaces.
"set number                " Add line numbers
"set cc=80                 " Set an 80 column border
"set clipboard=unnamedplus " use system clipboard
"set cursorline            " highlight current cursor line
set ttyfast               " Speed up scrolling
"set noswapfile            " disable creating swap file
set nobackup              " Never create backups
set ruler	          " show the cursor position all the time
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
"set laststatus=2          " tell VIM to always put a status line in, even
set cmdheight=1           " use a status bar that is 1 row high
set history=500           " keep 500 lines of command line history

set splitright            " When splitting a screen, move to the right/top window
set formatoptions+=1      " When wrapping paragraphs, don't end lines

set viminfo='20,\"50      " read/write a .viminfo file, don't store more
                          " than 50 lines of registers
set copyindent            " copy the previous indentation on autoindenting
"set shortmess+=I          " hide the launch screen

syntax on

" ====================================================== }}}

" Stuff to check and organize ========================== {{{

"set scrolloff=0
"set tags=tags;~/dev
"set undolevels=500
"set lpl
set cindent
set smartindent
set cinoptions=>4,e2,n-2,{2,l1,b0,+4,(0,us,U1,w1,W0,m0,j0,)20,*30
"set cino=>2,e-2,n-2,{2,^2,l1,+4,c0,C0,/0,(0,U1,w1,j1
set cinkeys=0{,0},0),0],:,0#,!^F,o,O,e,*<Return>
set cinwords=if,else,while,do,for,switch,case
set indentkeys=0{,0},0),0],:,0#,!^F,o,O,e,*<Return>

" ====================================================== }}}

" Handle color configs ================================= {{{
" set t_Co=256
"colorscheme advantage
"colorscheme base
"colorscheme bitterjug
"colorscheme BlackSea
"colorscheme bw
"colorscheme c16gui
"colorscheme candycode
"colorscheme colorer
"colorscheme d8g01
"colorscheme d8g03
"colorscheme d8g04
"colorscheme default
"colorscheme eldar
"colorscheme kellys
"colorscheme lanzarotta
"colorscheme monoacc
"colorscheme monokai-phoenix
"colorscheme murphy
"colorscheme neverland-darker
"colorscheme neverland2-darker
"colorscheme nightwish
"colorscheme norwaytoday
"colorscheme ps_color
"colorscheme simple256
"colorscheme spiderhawk
"colorscheme torte
"colorscheme vividchalk
"colorscheme woju
colorscheme xterm16

set background=dark
if (has("termguicolors"))
  set termguicolors
endif

noremap <F12> :Copilot panel<cr>
inoremap <F12> <Esc>:Copilot panel<cr>

map <silent><F5> :PREVCOLOR<cr>
map <silent><F6> :NEXTCOLOR<cr>
" ====================================================== }}}

" Wildmenu completion ================================== {{{
"set wildmenu           " make tab completion for files/buffers act like bash
set wildmode=list:full " show a list when pressing tab and complete first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=.hg,.git,.svn                    " Version control
" ====================================================== }}}

" Convenience mappings ================================= {{{
" Window Navigation with Ctrl-[hjkl]
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Use Q for formatting the current paragraph (or visual selection)
" This used to be `gq` and `gqap`, but the "w" variant is the same, but puts
" the cursor back at the original position after performing the
" transformation. See https://github.com/nvie/vimrc/issues/16
nmap Q gwap
vmap Q gw
"
" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Force Y to yank the whole line, including the newline character
nnoremap Y Y

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This mapping will yank the current line, paste it to the line above (or
" below), then move to the new line.  Then that line is selected and every
" character is replaced with an '*' character.
nnoremap <leader>1 yyPVr*
nnoremap <leader>2 yypVr*
" Or an '=' character.
nnoremap <leader>3 yyPVr=
nnoremap <leader>4 yypVr=
" Or an '#' character.
nnoremap <leader>5 yyPVr#
nnoremap <leader>6 yypVr#
" Or a '"' character.
nnoremap <leader>7 yyPVr"
nnoremap <leader>8 yypVr"


" Toggle mouse capture
noremap <F11> :call <SID>ToggleMouse()<CR>
inoremap <F11> <Esc>:call <SID>ToggleMouse()<CR>a

" Split the screen
noremap <silent><F10> :vsplit<CR>
inoremap <silent><F10> <Esc>:vsplit<CR>
noremap <silent><S-F10> :split<CR>
inoremap <silent><S-F10> <Esc>:split<CR>

" Remap ; to : for easier command control
nnoremap ; :

" Edit the vimrc file
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Rebuild Ctags (mnemonic RC -> CR -> <cr>)
nnoremap <silent> <leader><cr> :silent !update_tags >/dev/null 2>&1 &<cr>:redraw!<cr>

" Build SE (mnemonic RC -> CR -> <cr>)
nnoremap <leader>b :!~/bin/build <cr>

" Strip all trailing whitespace from a file, using \W
nnoremap <silent> <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
nnoremap <silent> <leader>w :write<CR>
nnoremap <silent> <leader>o :Update<CR> :so<CR>
nnoremap <silent> <leader>d :Ex<CR>
nnoremap <silent> Y yy

" Turn off search highlighting until next search.
nnoremap <silent> <leader>l :noh<cr>
nnoremap <silent> <leader><leader> :noh<cr>
nnoremap <silent> <esc><esc> :noh<cr>

" Use tab to jump brackets ...
nnoremap <tab> %
vnoremap <tab> %

" Ctrl+W to redraw the buffer's contents
"nnoremap <C-w> :filetype detect<cr>:redraw!<cr>

nnoremap <silent> <C-p> :bp<CR>
nnoremap <silent> <C-n> :bn<CR>
nnoremap <silent> <F2> :bp<CR>
nnoremap <silent> <F3> :bn<CR>

" C-U in insert/normal mode, to uppercase the word under cursor
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" This should clean up glitched syntax highlighting.
"nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Window Resizing {{{
" right/up : bigger
" left/down : smaller
nnoremap <m-right> :vertical resize +3<cr>
nnoremap <m-left> :vertical resize -3<cr>
nnoremap <m-up> :resize +3<cr>
nnoremap <m-down> :resize -3<cr>
" }}}

" Open a bash terminal buffer in vsplit mode
nnoremap <silent> <leader>v :vsplit term://bash<cr>

" ====================================================== }}}

" Text Folding ========================================= {{{
set foldenable                  " enable folding
set foldclose=all
set foldmethod=manual

" Make folding blocks in {} easier
map F zf%
map f zd

" Folding
" nnoremap <Space> za
" vnoremap <Space> za

function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

" ====================================================== }}}

" Git related stuff ==================================== {{{
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gv :GV!<CR>
nnoremap <leader>gd :Gdiff<CR>

" Conflict markers
" highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" shortcut to jump to next conflict marker
nnoremap <silent> <leader>j /\v^[<\|=>]{7}([^=].+)?$<CR>

" ====================================================== }}}

" Searching ============================================ {{{
" Use The Silver Searcher over grep, iff possible
if executable('ag')
   " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor
endif

" grep/Ack/Ag for the word under cursor
" vnoremap <leader>a y:grep! "\b<c-r>"\b"<cr>:cw<cr>
" nnoremap <leader>a :grep! "\b<c-r><c-w>\b"
vnoremap <leader>a y:Ag <c-r><cr>:cw<cr>
nnoremap <leader>a :Ag <c-r><c-w>
nnoremap K *N:grep! "\b<c-r><c-w>\b"<cr>:cw<cr>

" Define "Ag" command
command! -nargs=+ -complete=file -bar Ag silent! grep! <args> | cwindow | redraw!

" ====================================================== }}}

" Plugin configs ======================================= {{{

" NERDTree ============================================= {{{
" NERDTree - awesome filesystem interface
nnoremap <silent> <F7> :NERDTreeToggle<CR>
" ====================================================== }}}

" Taglist ============================================== {{{
" Settings for taglist.vim
"if executable('ctags')
"  nnoremap <silent> <F8> :TlistToggle<CR>
"  " let Tlist_Use_Right_Window=1
"  " let Tlist_Auto_Open=1
"  let Tlist_Enable_Fold_Column=0
"  let Tlist_Compact_Format=0
"  let Tlist_WinWidth=28
"  let Tlist_Exit_OnlyWindow=1
"  let Tlist_File_Fold_Auto_Close = 1
"  let Tlist_Process_File_Always = 1
"endif
" ====================================================== }}}

" GitGutter config ===================================== {{{
let g:gitgutter_max_signs = -1
"function! GitStatus()
"    let [a,m,r] = GitGutterGetHunkSummary()
"    return printf('+%d ~%d -%d', a, m, r)
set statusline+=%{GitStatus()}
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
omap a <Plug>(GitGutterTextObjectInnerPending)
omap t <Plug>(GitGutterTextObjectOuterPending)
xmap a <Plug>(GitGutterTextObjectInnerVisual)
xmap t <Plug>(GitGutterTextObjectOuterVisual)
"highlight GitGutterAddLine          ctermbg=236 guibg=DarkGrey
"highlight GitGutterChangeLine       ctermbg=240 guibg=LightGrey
"highlight GitGutterChangeDeleteLine ctermbg=240 guibg=LightGrey
""highlight GitGutterDeleteLine      ctermfg=DarkGrey ctermbg=196 gui=bold guifg=DarkGrey guibg=DarkRed
"highlight GitGutterAdd              ctermbg=236 guibg=DarkGrey
"highlight GitGutterChange           ctermbg=240 guibg=LightGrey
"highlight GitGutterChangeDelete     ctermbg=240 guibg=LightGrey
"highlight GitGutterDelete           ctermfg=196 ctermbg=DarkGrey gui=bold guifg=DarkGrey guibg=DarkRed
let g:gitgutter_highlight_lines=0
let g:gitgutter_sign_added='++'
let g:gitgutter_sign_modified='~~'
let g:gitgutter_sign_removed='--'
let g:gitgutter_sign_removed_first_line='^^'
let g:gitgutter_sign_modified_removed='--'
"let g:gitgutter_set_sign_backgrounds=1

autocmd BufWritePost * GitGutter
function! CleanUp(...)
  if a:0  " opfunc
    let [first, last] = [line("'["), line("']")]
  else
    let [first, last] = [line("'<"), line("'>")]
  endif
  for lnum in range(first, last)
    let line = getline(lnum)

    " clean up the text, e.g.:
    let line = substitute(line, '\s\+$', '', '')

    call setline(lnum, line)
  endfor
endfunction

nmap <silent> <Leader>x :set opfunc=CleanUp<CR>g@
" ====================================================== }}}

" Airline config ======================================= {{{
" let g:airline_theme='dark'
" let g:airline_theme='ouo'
" let g:airline_theme='onedark'
let g:airline_theme='badwolf'
let g:one_allow_italics = 1
" ====================================================== }}}

" Plugin config: Rainbow Parens ======================== {{{
"
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
  let g:rainbow_conf = {
  \ 'guifgs': ['red', 'orange', 'yellow', 'green', 'blue', 'purple', 'firebrick'],
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

" ====================================================== }}}

" Plugin config: You Complet Me ======================== {{{
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_disable_for_files_larger_than_kb = 10000
" ====================================================== }}}

" Pulse ================================================ {{{

"function! PulseCursorLine()
"    setlocal cursorline
"
"    redir => old_hi
"        silent execute 'hi CursorLine'
"    redir END
"    let old_hi = split(old_hi, '\n')[0]
"    let old_hi = substitute(old_hi, 'xxx', '', '')
"
"    hi CursorLine guibg=#3a3a3a
"    redraw
"    sleep 14m
"
"    hi CursorLine guibg=#4a4a4a
"    redraw
"    sleep 10m
"
"    hi CursorLine guibg=#3a3a3a
"    redraw
"    sleep 14m
"
"    hi CursorLine guibg=#2a2a2a
"    redraw
"    sleep 10m
"
"    execute 'hi ' . old_hi
"    setlocal nocursorline
"endfunction

" ====================================================== }}}

" Mouse management ===================================== {{{
" Borrowed from https://github.com/nvie/vim-togglemouse

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

" ====================================================== }}}

" Python mode configuration ============================ {{{

" Don't run pylint on every save
let g:python3_host_prog = '/emc/leblal/.local/bin/python3'
let g:pymode = 1
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_doc = 0
let g:pymode_doc_bind = 'K'
let g:pymode_folding = 0
let g:pymode_indent = 0
let g:pymode_lint = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore = ''
let g:pymode_lint_message = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_select = ''
let g:pymode_lint_signs = 1
let g:pymode_motion = 0
let g:pymode_options = 0
let g:pymode_paths = []
let g:pymode_quickfix_maxheight = 6
let g:pymode_quickfix_minheight = 3
let g:pymode_rope = 1
let g:pymode_rope_completion = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_run = 0
let g:pymode_run_bind = '<leader>r'
let g:pymode_trim_whitespaces = 0

" ====================================================== }}}

" MiniBufExplorer config =============================== {{{
let g:miniBufExplMaxSize = 2
let g:miniBufExplorerAutoStart = 0
let g:miniBufExplCycleArround = 1
let g:miniBufExplStatusLineText = 1
nnoremap <silent> <F4> :MBEToggle<cr>
nnoremap <silent> <F2> :MBEbn<CR>
nnoremap <silent> <F3> :MBEbp<CR>

"This would still work, but the above has other features.
"nnoremap <silent> <C-p> :bp<CR>
"nnoremap <silent> <C-n> :bn<CR>
"nnoremap <silent> <F2> :bp<CR>
"nnoremap <silent> <F3> :bn<CR>
" ====================================================== }}}

" Vim Search Pulse ===================================== {{{
let g:vim_search_pulse_color_list = [196, 208, 214, 220, 226]
" ====================================================== }}}

" ====================================================== }}}

" Other configuurations ================================ {{{
" Abbreviations
iab _DATE <C-R>=strftime("Date: %A %B, %e %Y\nTime: %I:%M:%S %p %Z")<CR>

hi Normal guibg=NONE ctermbg=NONE

if has("autocmd")
  filetype plugin indent on

  augroup vim_files "{{{
    au!

    " Bind <F1> to show the keyword under cursor
    " general help can still be entered manually, with :h
    autocmd FileType vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
    autocmd FileType vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
  augroup end "}}}

  augroup git_files "{{{
      au!

      " Don't remember the last cursor position when editing commit
      " messages, always start on line 1
      autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
  augroup end "}}}

  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 80 characters.
    autocmd FileType text setlocal textwidth=80
  augroup END

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
          \ if &filetype != "gitcommit" && line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

endif
" ====================================================== }}}

