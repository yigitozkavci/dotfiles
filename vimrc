set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" NERDTree. No explanation is needed.
Plugin 'scrooloose/nerdtree'
" Finding files with Ctrl+P
Plugin 'ctrlpvim/ctrlp.vim'
" Language pack.
Plugin 'sheerun/vim-polyglot'
" Cool line bar at bottom.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Git branch tracker for vim.
Plugin 'tpope/vim-fugitive'
" Vim markdown preview.
Plugin 'JamshedVesuna/vim-markdown-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

:syntax on

" Display Line Numbers
:set number

" Tab Config
:set expandtab
:set tabstop=2
:set shiftwidth=2

" Now, vim and mac shares the same clipboard.
set clipboard=unnamed

" Custom Mappings
map <S-E> :NERDTreeToggle <CR>
map <C-U> 10j
map <C-I> 10k
map <C-A> <C-W>h
map <C-D> <C-W>l
let vim_markdown_preview_hotkey='<C-m>'
