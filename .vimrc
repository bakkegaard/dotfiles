"reload .vimrc -> :so %


"used for bundle
set nocompatible "be iMproved, required
filetype off "required


	let IsVundleInstalled=1
	"Check if bundle is installed
	let vundle_readme= expand('~/.vim/bundle/vundle/README.md')
	if !filereadable(vundle_readme)

		"If it is not installed clone it from the git repository
		silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle

		"And tell it wasn't installed
		let IsVundleInstalled=0

	endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

"NERDCommenter for fancy comment shortcuts
Plugin 'scrooloose/nerdcommenter'

"NERDTree for exploring folders and files
Plugin 'scrooloose/nerdtree'

"Make a nice statusline
Plugin 'Lokaltog/vim-powerline'

Plugin 'morhetz/gruvbox'

Plugin 'vimwiki/vimwiki'

	if IsVundleInstalled==0
		"If we just installed vundle, then install all the bundles
		:PluginInstall
	endif


"FOR VIM-POEWRLIN BEGIN
    set laststatus=2   " Always show the statusline

    set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

"FOR VIM-POEWRLIN END

"Make vim detect filetype specific plugins
filetype plugin on

"Make vim detect how to indent on specific filetypes
filetype indent on

"Use syntax highlightning
syntax on 

"Enable line numbers
set nu

"Make tab behave nice
set ts=3
set sts=3
set sw=3

"""""""""""""
" => Search stuff
"""""""""""""

"Ignore case 
set ignorecase

"Highlight search
set hlsearch

"Search on the go
set incsearch

"use smartcase
set smartcase

"Make standard encoding utf-8
set encoding=utf8

"Use indent from line above when opening a new line
set autoindent

"switch ; and :
noremap ; :
noremap : ;

"Make NERDTree toogle on <leader>n
noremap <leader>n :NERDTreeToggle<CR>

"remape <space> to <leader>
nmap <space> <leader>

"To get vim to stop whining about buffers being modified and then hidden
set hidden

"undofile after leaving
set undofile

"Set gruvbox as theme
colo gruvbox
set bg=dark

" Shortcut to rapidly toggle `set list`
noremap <leader>l :set list!<CR>

"Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"Make backspace behave
set backspace=indent,eol,start

"Wraplines if filetype is tex or text
autocmd FileType tex,text set tw=79

"Ask to save on quitting
set confirm

"make <Esc> work in terminal mode
tnoremap <Esc> <C-\><C-n>
