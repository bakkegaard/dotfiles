let g:solarized_termcolors=256

" auto-install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'

" let vim-plug manage vim-plug
Plug 'junegunn/vim-plug'

"NERDCommenter for fancy comment shortcuts
Plug 'scrooloose/nerdcommenter'

"NERDTree for exploring folders and files
Plug 'scrooloose/nerdtree'

"Nice color theme
Plug 'morhetz/gruvbox'

"Fuzzy find
Plug 'ctrlpvim/ctrlp.vim'

"Handle tables in Markdown
Plug 'dhruvasagar/vim-table-mode'

"Fancy status line
Plug 'vim-airline/vim-airline'

"Snippets
Plug 'Shougo/neosnippet.vim'


call plug#end()

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

noremap <leader>ww :NERDTree ~/vimwiki<CR>

noremap <leader>wp :CtrlP ~/vimwiki<CR>

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

"make ctrlp look for hidden files
let g:ctrlp_show_hidden = 1

"make tables markdown compatible
let g:table_mode_corner='|'

"Show substitue command incremential
set inccommand=nosplit

"Make Neovim detect tex files correctly
let g:tex_flavor = 'tex'

" Make <leader>m compile latex file
autocmd FileType tex noremap <leader>m :call CompileMagic()<CR>

"The above command compiles with the current file name, unless masterfile
"variable is set using 
"    :let masterfile="somefile.tex"
"Then it will compile with that instead
function CompileMagic()
	if exists("g:masterfile")
		execute "!latexmk -pdf -pdflatex=\"pdflatex\" " . g:masterfile
	else
		execute "!latexmk -pdf -pdflatex=\"pdflatex\" ". expand('%:t') 
	endif
endfunction
