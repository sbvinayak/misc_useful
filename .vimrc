" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
" filetype indent plugin on
 
" Enable syntax highlighting
syntax on

" Added by Vinayak to set .mpl to perl syntax highlights
au BufNewFile,BufRead *.mpl set filetype=perl

" Setting the default color scheme to koehler
colorscheme koehler


"------------------------------------------------------------
"Vundle plugin
"
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"------------------------------------------------------------
"https://realpython.com/vim-and-python-a-match-made-in-heaven/#conclusion
"Python Essestials
"------------------------------------------------------------
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
vnoremap <space> zf
"The initial command, set foldmethod=indent, creates folds based upon line indents. This, however, often creates more folds than you really want. But have no fear! There are several extensions that attempt to rectify that. We recommend SimpylFold. Install it with Vundle by adding the following line to .vimrc:
Plugin 'tmhedberg/SimpylFold'

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
if has('mouse')
set mouse=a
endif
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set ts=2
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set smartindent
"set expandtab
"set copyindent preserveindent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

Plugin 'vim-scripts/indentpython.vim'

"This will mark extra whitespace as bad and probably color it red.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"------------------------------------------------------------
" Auto Complete 
"
"Under the hood, YouCompleteMe uses a few different auto-completers (including Jedi for Python), and it needs some C libraries to be installed for it to work correctly. The docs have very good installation instructions, so I won¿t repeat them here, but be sure you follow them.

"Bundle 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'   " jedi for python
Plugin 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plugin 'vim-airline/vim-airline'  " make statusline awesome

"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"Plugin 'vim-syntastic/syntastic'
"Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

"Cool plugins
"Plugin 'roxma/nvim-yarp'  " dependency of ncm2
"Plugin 'ncm2/ncm2'  " awesome autocomplete plugin
"Plugin 'HansPinckaers/ncm2-jedi'  " fast python completion (use ncm2 if you want type info or snippet support)
"Plugin 'ncm2/ncm2-bufword'  " buffer keyword completion
"Plugin 'ncm2/ncm2-path'  " filepath completion

"------------------------------------------------------------
"Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"just add a bit of logic to define which scheme to use based upon the VIM mode:
if has('gui_running')
  set background=dark
  colorscheme koehler
else
  colorscheme zenburn
endif

"Solarized also ships with a dark and light theme. To make switching between them very easy (by pressing F5) add:
call togglebg#map("<F5>")

"------------------------------------------------------------
"File Browsing
"If you want a proper file tree, then :NERDTree is the way to go:

Plugin 'scrooloose/nerdtree'
"If you want to use tabs, utilize vim-nerdtree-tabs:

Plugin 'jistr/vim-nerdtree-tabs'
"Want to hide .pyc files? Then add the following line:

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"------------------------------------------------------------
"Super Searching
"Want to search for basically anything from VIM? Check out ctrlP:

Plugin 'kien/ctrlp.vim'
"As you might expect, pressing Ctrl+P will enable the search, so you can just start typing. If your search matches anything close to the file you¿re looking for, it will find it. Oh, and it¿s not just files: it will find tags as well!

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"options to highlight the cursor position
set cursorline
set cursorcolumn

set linespace=2
set bs=2

autocmd BufNewFile,BufRead *.json set ft=javascript

Plugin 'alpertuna/vim-header'

let g:header_field_author = 'Vinayak Srinath'
let g:header_field_author_email = 'vinayaks@nvidia.com'
map <F4> :AddHeader<CR>
