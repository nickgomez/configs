" https://realpython.com/vim-and-python-a-match-made-in-heaven/
" TODO: Revisit YouCompleteMe and follow docs

"""" Vundle

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold' " Code folding
Plugin 'vim-scripts/indentpython.vim' " Indentation helper
" Plugin 'Valloric/YouCompleteMe' " Auto completer
Plugin 'vim-syntastic/syntastic' " Syntax checker
Plugin 'nvie/vim-flake8' " PEP-8 checker
Plugin 'scrooloose/nerdtree' " file browser
Plugin 'jistr/vim-nerdtree-tabs' " tabs??
Plugin 'ctrlpvim/ctrlp.vim' " Searching??
" Plugin 'tpope/vim-fugitive' " Git integration - need to learn
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'bling/vim-bufferline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 's3rvac/vim-syntax-yara' " yara syntax highlighting

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""" Airline Configs
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dracula'

"""" Other Stuff

" Split navigations - Instead of doing Ctrl-W -> W to navigate panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za

" See docstrings for folded code (Python)
let g:SimpylFold_docstring_preview=1

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" PEP 8 Indentation
au BufNewFile,BufRead *.py :
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Flag Unnecessary Whitespace - May want to include/remove file types
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Enable UTF-8 - May need to put this under "au" definitions
set encoding=utf-8

" Unsure what this does
let python_highlight_all=1

" Access system clipboard
set clipboard=unnamed

" YARA Syntax highlighting
au BufNewFile,BufRead *.yar,*.yara :setlocal filetype=yara

"""" Older settings below
syntax on
set nu
set smartindent
set hlsearch

filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
