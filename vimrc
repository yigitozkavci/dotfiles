set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'
" NERDTree. No explanation is needed.
Plugin 'scrooloose/nerdtree'
" Finding files with Ctrl+P.
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
" Emmet for vim.
Plugin 'mattn/emmet-vim'
" Rubocop for ruby in vim.
Plugin 'ngmy/vim-rubocop'

" -- Ultisnip START -- "

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" -- Ultisnip END -- "

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
map _ <C-Y>,i
let vim_markdown_preview_hotkey='<C-m>'
noremap tn :tabnew<Space>
noremap tw :tabclose<CR>
noremap tj :tabprev<CR>
noremap tk :tabnext<CR>
noremap th :tabfirst<CR>
noremap tl :tablast<CR>
noremap cl iconsole.log('
noremap cp viwp

" NERDTree Configuration
let NERDTreeMapOpenInTab='tt'
autocmd vimenter * NERDTree<C-d>:q<C-a>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
