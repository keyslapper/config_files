" My ~/.vimrc.
"
" All plugins are now managed using vim-plug
" Plugin management is near the top of the file, configuration near the bottom.

" This must be first, because it changes other options as a side effect.
set nocompatible	" Use Vim defaults (much better!)
filetype off

" Plugin settings {{
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

" https://github.com/junegunn/vim-plug
Plug 'junegunn/vim-plug'
" https://github.com/flazz/vim-colorschemes.git
Plug 'flazz/vim-colorschemes'
" https://github.com/vim-scripts/ScrollColors.git
Plug 'vim-scripts/ScrollColors'
" https://github.com/davidhalter/jedi-vim.git
Plug 'davidhalter/jedi-vim'
" https://github.com/vim-syntastic/syntastic.git
" Plug 'vim-syntastic/syntastic'
" https://github.com/ervandew/supertab.git
Plug 'ervandew/supertab'
" https://github.com/scrooloose/nerdtree.git
Plug 'scrooloose/nerdtree'
" https://github.com/tpope/vim-fugitive.git
Plug 'tpope/vim-fugitive'
" https://github.com/junegunn/gv.vim.git
Plug 'junegunn/gv.vim'
" https://github.com/weynhamz/vim-plugin-minibufexpl.git
Plug 'weynhamz/vim-plugin-minibufexpl'
" https://github.com/luochen1990/rainbow.git
Plug 'luochen1990/rainbow'
" https://github.com/tmhedberg/matchit.git
Plug 'tmhedberg/matchit'
" https://github.com/gnattishness/cscope_maps.git
" Plug 'gnattishness/cscope_maps'
" https://github.com/valloric/youcompleteme.git
" Plug 'valloric/youcompleteme'
" https://github.com/mileszs/ack.vim.git
Plug 'mileszs/ack.vim'
" https://github.com/junegunn/fzf.git
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" https://github.com/junegunn/fzf.vim.git
Plug 'junegunn/fzf.vim'
" https://github.com/vim-airline/vim-airline.git
Plug 'vim-airline/vim-airline'
" https://github.com/vim-airline/vim-airline-themes.git
Plug 'vim-airline/vim-airline-themes'
" https://github.com/scrooloose/nerdcommenter.git
" Plug 'scrooloose/nerdcommenter'
" https://github.com/python-mode/python-mode.git
" Plug 'python-mode/python-mode.git'
" https://github.com/junegunn/vim-slash.git
Plug 'junegunn/vim-slash'


" https://github.com/rakr/vim-one.git
" Plug 'rakr/vim-one'

" https://github.com/rip-rip/clang_complete.git
" Plug 'rip-rip/clang_complete'

" add new plugins above this line.
" ======================================================== }}
call plug#end()

filetype plugin indent on

source $VIMRUNTIME/defaults.vim

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set backspace=indent,eol,start  " allow backspacing over everything in insert mode

set viminfo='20,\"50  " read/write a .viminfo file, don't store more
                      " than 50 lines of registers

" Other stuff I like
set showmode                    " always show what mode we're currently editing in
set scrolloff=0
set history=500  " keep 500 lines of command line history
set ruler	       " show the cursor position all the time
set showcmd      " display incomplete commands
set incsearch    " do incremental searching
set expandtab
" set nosmarttab
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set ts=8
set nomodeline
set tags=tags;~/dev
set undolevels=500
set noignorecase
set hls ic
" set shiftwidth=2
set lpl
set splitright
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)
set shortmess+=I                " hide the launch screen
set ttyfast

set cindent
set cinoptions=>4,e2,n-2,f0,{2,}0,^-2,:s,=s,l1,b0,gs,hs,ps,ts,is,+4,c3,C0,/0,(2s,us,U1,w1,W0,m0,j0,)20,*30

set nobackup

set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title

" Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This mapping will yank the current line, past it to the line above (or
" below), then move to the new line.  Then that line is selected and every
" character is replaced with an '*' character.
nnoremap <leader>1 yyPVr*
nnoremap <leader>2 yypVr*
" Or an '=' character.
nnoremap <leader>3 yyPVr=
nnoremap <leader>4 yypVr=
" Or a '"' character.
nnoremap <leader>5 yyPVr"
nnoremap <leader>6 yypVr"

" Git commands
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gv :GV!<CR>
nnoremap <leader>gd :Gdiff<CR>

" Keep search matches in the middle of the window
" and pulse the line when moving to them.
noremap <plug>(slash-after) zz:call PulseCursorLine()<cr>


" Edit the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Folding rules {{{
set foldenable                  " enable folding
set foldclose=all
set foldmethod=manual
" Make folding blocks in {} easier
map F zf%
map f zd

" Folding
nnoremap <Space> za
vnoremap <Space> za

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

" }}}

" Editor layout {{{
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set cmdheight=1                 " use a status bar that is 1 row high
" }}}

imap  
lmap  
cmap  
cnoremap w!! w !sudo tee % >/dev/null

" Set the color range and colorscheme
" set t_Co=256
" colorscheme lou
" colorscheme one
colorscheme vividchalk
set background=dark

map <silent><F4> :PREVCOLOR<cr>
map <silent><F5> :NEXTCOLOR<cr>

" Switch syntax highlighting on
syntax on
" Also switch on highlighting the last used search pattern.
" set hlsearch
nnoremap <silent> <tab> :nohlsearch<cr>


" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>

" Ctrl+W to redraw the buffer's contents
"
" For some reason unclear to me, new files opened via the quickfix window
" (for example Flow errors triggered in unopened files) don't get
" their file types detected automatically.  For these new buffers, the
" filetype= (empty).
"
" This can be fixed by running
"
"     :filetype detect
"
" In those buffers, but this is super laborious.  This just plugs that
" under my existing "refresh the screen" shortcut <c-w>.
nnoremap <C-w> :filetype detect<cr>:redraw!<cr>

" Strip all trailing whitespace from a file, using \W
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

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
command -nargs=+ -complete=file -bar Ag silent! grep! <args> | cwindow | redraw!

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

" Conflict markers {{{
" highlight conflict markers
match ErrorMsg '\v^[<\|=|>]{7}([^=].+)?$'

" shortcut to jump to next conflict marker
nnoremap <silent> <leader>c /\v^[<\|=>]{7}([^=].+)?$<CR>
" }}}



" Only do this part when compiled with support for autocommands
if has("autocmd")

  autocmd BufEnter * :syntax on

  autocmd BufEnter,BufReadPost * :RainbowToggleOn

  augroup vim_files "{{{
    au!

      " Bind <F1> to show the keyword under cursor
      " general help can still be entered manually, with :h
      autocmd filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
      autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
    augroup end "}}}

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

  augroup python_files "{{{
      au!

      " This function detects, based on Python content, whether this is a
      " Django file, which may enabling snippet completion for it
      fun! s:DetectPythonVariant()
          let n = 1
          while n < 50 && n < line("$")
              " check for django
              if getline(n) =~ 'import\s\+\<django\>' || getline(n) =~ 'from\s\+\<django\>\s\+import'
                  set ft=python.django
                  "set syntax=python
                  return
              endif
              let n = n + 1
          endwhile
          " go with html
          set ft=python
      endfun
      autocmd BufNewFile,BufRead *.py call s:DetectPythonVariant()

      " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
      " earlier, as it is important)
      autocmd filetype python setlocal textwidth=78
      autocmd filetype python match ErrorMsg '\%>120v.\+'

      " But disable autowrapping as it is super annoying
      autocmd filetype python setlocal formatoptions-=t

      " Folding for Python (uses syntax/python.vim for fold definitions)
      "autocmd filetype python,rst setlocal nofoldenable
      "autocmd filetype python setlocal foldmethod=expr

      " Python runners
     "autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
     "autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
     "autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
     "autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

      " Automatic insertion of breakpoints
      autocmd filetype python nnoremap <buffer> <leader>bp :normal oimport pdb; pdb.set_trace()  # TODO: BREAKPOINT  # noqa<Esc>

      " Run a quick static syntax check every time we save a Python file
      " autocmd BufWritePost *.py call Flake8()

      " Defer to isort for sorting Python imports (instead of using Unix sort)
      autocmd filetype python nnoremap <leader>s mX:%!isort -<cr>`X:redraw!<cr>

  augroup end " }}}

  augroup markdown_files "{{{
      au!

      autocmd filetype markdown noremap <buffer> <leader>p :w<CR>:!open -a 'Marked 2' %<CR><CR>
  augroup end " }}}

  augroup git_files "{{{
      au!

      " Don't remember the last cursor position when editing commit
      " messages, always start on line 1
      autocmd filetype gitcommit call setpos('.', [0, 1, 1, 0])
  augroup end "}}}

  autocmd BufReadPost *
      \ if &filetype != "gitcommit" && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

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
" Plugin config: MiniBufExplorer
" Prevent the buffer explorer window from
" opening until we open at least 4 buffers.
" Default is 2.
let g:miniBufExplBuffersNeeded = 4
" <F6> Opens or closes the buffer explorer window.
" noremap <silent> <F6> :MBEToggle<CR>
" Available commands: MBEToggle  MBEToggleAll  MBEToggleMRU  MBEToggleMRUAll
" scrolling through the open buffers.
nnoremap <silent> <F2> :MBEbp<CR>
nnoremap <silent> <F3> :MBEbn<CR>
hi MBEChanged guibg=darkblue ctermbg=darkblue

let g:airline_theme='dark'
let g:one_allow_italics = 1

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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

" Pulse ------------------------------------------------------------------- {{{

function! PulseCursorLine()
    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 14m

    hi CursorLine guibg=#4a4a4a
    redraw
    sleep 10m

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 14m

    hi CursorLine guibg=#2a2a2a
    redraw
    sleep 10m

    execute 'hi ' . old_hi
    setlocal nocursorline
endfunction

" }}}

" Python mode configuration ----------------------------------------------- {{{

" Don't run pylint on every save
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

" }}}

" fzf config -------------------------------------------------------------- {{{

" Invoke fzf, but CommandT style
nnoremap <leader>t :Files<cr>
nnoremap <leader>. :Tags<cr>
" nnoremap <leader>b :Buffers<cr>
nnoremap <silent> <F6> :Buffers<cr>
" ------------------------------------------------------------------------- }}}

" C-U in insert/normal mode, to uppercase the word under cursor
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwUe

" Quote current selection
" TODO: This only works for selections that are created "forwardly"
vnoremap <leader>" <esc>a"<esc>gvo<esc>i"<esc>gvo<esc>ll
vnoremap <leader>' <esc>a'<esc>gvo<esc>i'<esc>gvo<esc>ll

" Switch from block-cursor to vertical-line-cursor when going into/out of
" insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"




