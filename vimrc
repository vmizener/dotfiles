"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My vimrc file.
" How fantastic! (lol)
"
" Changelog
" =========
" 2018 May 04
"   Courtesy http://nvie.com/posts/how-i-boosted-my-vim/
"   - Added leader key mapping (comma)
"   - Dropped F12 show chars in favor of passively showing chars
"   - Undo history is now 500
"   - Clearing search history is now <Leader>/ instead of :C
"   Removed paste option (so inoremap works again)
"   Added pastetoggle key (F2)
"   Use jk to get out of insert mode now
"   Fold toggle now is <Leader><Space> (instead of just <Space>)
"   Now uses autoread
"   Now keeps lines above and below the cursor at all times
"   Pathogen enabled
"   Removed textwidth (autowrap)
"
" 2018 May 01
"   Folds are closed by default now
"   - (This breaks the `zm` command until a `zM` is used though)
"   - Make sure to have syntax files defined in .vim/syntax
"
" 2018 Apr 28
"   Updated clipboard settings for X11 support
"   - Use XQuartz for Mac, X11 otherwise
"   - Compile vim with +clipboard and +xterm_clipboard
"
" 2018 Apr 27
"   Now uses 'desert' colorscheme
"
" 2018 Apr 23
"   Moved clipboard/paste settings to be before other edit settings
"   Added autoindent
"
" 2017 Sep 01
"   Migrated for home-use (meh)
"   Uses ${HOME} instead of ${REMOTE_SCRIPTS} now
"
" 2017 May 25
"   Updated again to now use ${REMOTE_SCRIPTS} over $NET_HOME
"
" 2017 May 16
"   Updated write paths to use $NET_HOME rather than hard-coding it
"   (7.06 relased yesterday, man time flies)
"
" 2016 Jun 28
"   Copy/pasting between sessions now works between networked machines
"   Copy/pasting between sessions now uses CTRL instead of SHIFT
"
" 2015 Jun 09
"   Massive overhaul! (courtesy Miko Bartnicki <mikobartnicki@gmail.com>)
"   Reorganized everything into categories
"   Added more copy/paste behavior improvements
"   Added shift-tab behavior
"   Linewrap is now set to 80 columns
"   Encoding is now utf-8 everywhere if possible
"   Added showmode
"   Added some more search options
"   Search now centers view on match
"   F12 now shows special characters
"   Now asks confirmation on quit if there are unsaved changes
"   Added filetype detection
"   Removed backups
"
" 2014 Oct 29
"   Added cross-session copy-paste commands (courtesy ubuntuforums)
"   Added cursorline highlighting
"   Added paren match highlighting
"   Vertical cursor movement now goes by visual line
"
" 2014 Oct 22
"   Made the changelog pretty.
"   Commented out nowrap (haha that was fast)
"
" 2014 Oct 21
"   Added search pattern clear command (courtesy StackOverflow)
"   Added nowrap
"
" 2014 Oct 20
"   Added mouse functionality and ScrollWheel stuff
"   Credit to StackOverflow for dat ez copy-paste!
"
" 2014 Sep 25
"   Created
"   (6.82 released today wow)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible            " We all about that IMPROVED game
let mapleader=","           " C O M M A L I F E

" Custom path handling?  Feelsgoodman
execute pathogen#infect()

"""""""""""""""""""""'
" Display Settings
"""""""""""""""""""""'

set cursorline      " Highlight the current cursor line
set encoding=utf-8  " Encoding used for displaying files
" set nowrap          " Disable line wrapping
set number          " Show line numbers on left
set ruler           " Always show cursor position (numbers at bottom)
set scrolloff=10    " Always show 5 lines above/below cursor
set showcmd         " Display incomplete commands
set showmatch       " Highlight matching braces
set showmode        " Always show current mode (e.g. INSERT)
syntax on           " Turn on color syntax highlighting

" setlocal spell spelllang=en_us  " Enable spellcheck
" Get theme colors
colorscheme desert

"""""""""""""""""""""'
" Edit Settings
"""""""""""""""""""""'

set backspace=indent,eol,start  " Allow backspacing over everything in insert mode

if has('clipboard')
    set clipboard=unnamed       " Copy/paste using the system register by default
    if has('unnamedplus')       " X11 support
        set clipboard+=unnamedplus
    endif
endif

set autoindent      " Automatic indentation
set expandtab       " Fill tabs with spaces
set nojoinspaces    " No extra space after '.' when joining lines
set shiftwidth=4    " Set indentation depth to 4 columns
set softtabstop=4   " Backspacing over 4 spaces like over tabs
set tabstop=4       " Set tabular length to 4 columns
" set textwidth=80    " Wrap lines automatically at the 80th column

set foldlevelstart=20   " Files are opened with closed folds (20 deep)
set pastetoggle=<F2>    " Toggle paste setting

" Copy and paste between Vim sessions
" Ctrl + y     (in visual mode) = Copy selection to buffer
vmap <C-y> :w! ${HOME}/.vbuf<CR>
" Ctrl + y (not in visual mode) = Copy line to buffer
nmap <C-y> :.w! ${HOME}/.vbuf<CR>
" Ctrl + p (not in visual mode) = Paste
nmap <C-p> :r ${HOME}/.vbuf<CR>

" Shift-tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Quick folding
nnoremap <Leader><Space> za
vnoremap <Leader><Space> za

"""""""""""""""""""""'
" I/O Settings
"""""""""""""""""""""'

filetype on             " Enable filetype detection
filetype plugin indent on

set autoread            " Automatically load file changes
set confirm             " Require :q! in case of unsaved changes
set fileencoding=utf-8  " Encoding used for writing files
set nobackup            " Do not keep the backup~ file

"""""""""""""""""""""'
" Interface Settings
"""""""""""""""""""""'

set history=500     " Significantly increase command line history
set mouse=a         " Allow mouse functionality in all modes
set undolevels=500  " Mucho undo

" Clear search with <Leader>/ without modifying cmd history
nmap <silent> <Leader>/ :nohlsearch<CR>

" Show trailing whitespace and non-printable characters
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Get to normal mode with jk
inoremap jk <Esc>

" Center view on the search result
noremap n nzz
noremap N Nzz

" Vertical movement by visual line
nnoremap j gj
nnoremap k gk

" Set scroll-wheel behavior:
"           Scroll Wheel = Up/Down 4 lines
"   Shift + Scroll Wheel = Up/Down 1 page
" Control + Scroll Wheel = Up/Down half page
"    Meta + Scroll Wheel = Up/Down 1 line
noremap <ScrollWheelUp>      4<C-Y>
noremap <ScrollWheelDown>    4<C-E>
noremap <S-ScrollWheelUp>    <C-B>
noremap <S-ScrollWheelDown>  <C-F>
noremap <C-ScrollWheelUp>    <C-U>
noremap <C-ScrollWheelDown>  <C-D>
noremap <M-ScrollWheelUp>    <C-Y>
noremap <M-ScrollWheelDown>  <C-E>
inoremap <ScrollWheelUp>     <C-O>4<C-Y>
inoremap <ScrollWheelDown>   <C-O>4<C-E>
inoremap <S-ScrollWheelUp>   <C-O><C-B>
inoremap <S-ScrollWheelDown> <C-O><C-F>
inoremap <C-ScrollWheelUp>   <C-O><C-U>
inoremap <C-ScrollWheelDown> <C-O><C-D>
inoremap <M-ScrollWheelUp>   <C-O><C-Y>
inoremap <M-ScrollWheelDown> <C-O><C-E>

"""""""""""""""""""""'
" Search Settings
"""""""""""""""""""""'

set hlsearch    " Highlight search results
set incsearch   " Do incremental search
set ignorecase  " Do case-insensitive search ...
set smartcase   " ... unless capital letters are used
