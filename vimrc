set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256
set term=screen-256color
" set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Enable matching blocks
runtime macros/matchit.vim

" let Vundle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'

" NERDTree. No explanation is needed.
Plugin 'scrooloose/nerdtree'

Plugin 'easymotion/vim-easymotion'

" Vim Grepper
Plugin 'mhinz/vim-grepper'

" Finding files with Ctrl+P.
Plugin 'ctrlpvim/ctrlp.vim'

" Language pack.
Plugin 'sheerun/vim-polyglot'

" Search faster
Plugin 'mileszs/ack.vim'

" Elm support for vim
Plugin 'elmcast/elm-vim'

" Cool line bar at bottom.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Git branch tracker for vim.
Plugin 'tpope/vim-fugitive'

" Vim markdown preview.
Plugin 'JamshedVesuna/vim-markdown-preview'

" Emmet for vim.
" Plugin 'mattn/emmet-vim'

" Rubocop for ruby in vim.
Plugin 'ngmy/vim-rubocop'

" Ruby on Rails tools.
Plugin 'tpope/vim-rails'

" Ag search
Plugin 'rking/ag.vim'

" Commenting lines, paragraphs or words.
Plugin 'tpope/vim-commentary'

" Surrounding items with characters.
Plugin 'tpope/vim-surround'

" Enable repeating supported plugin maps with '.'
Plugin 'tpope/vim-repeat'

" Creates a text object related to indentation level.
Plugin 'michaeljsmith/vim-indent-object'

" Snippets are separated from the engine. Add this if you want them.
Plugin 'honza/vim-snippets'

" Allows using custom text objects.
Plugin 'kana/vim-textobj-user'

" Text objects for ruby.
Plugin 'rhysd/vim-textobj-ruby'

" Auto-generates vim end blocks.
Plugin 'tpope/vim-endwise'

" Allows navigating between vim panes like we do in tmux panes.
Plugin 'christoomey/vim-tmux-navigator'

" Quick search for Dash application
Plugin 'rizzatti/dash.vim'

" TaskWarrior in vim
Bundle 'farseer90718/vim-taskwarrior'

" All of your Plugins must be added before the following line.
call vundle#end()            " required

filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete
:syntax on
:colorscheme tomorrow_night

" Formatting for elm
let g:elm_format_autosave = 1

" Highlight current line
"
" CTRL-P Options
:set cursorline
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_show_hidden = 1

" Display Line Numbers.
:set number

" Tab Config
:set expandtab
:set tabstop=2
:set shiftwidth=2
:retab

" Now, vim and mac shares the same clipboard.
set clipboard+=unnamed

" Custom Mappings.
map <S-E> :NERDTreeToggle <CR>
map <C-U> 10j
map <C-I> 10k
map _ <C-Y>,i
:set relativenumber
let vim_markdown_preview_hotkey='<C-m>'
noremap gb <C-^>
nnoremap gk ddkP
nnoremap gj ddp


" Tab shortcuts.
noremap tn :tabnew<Space>
noremap tw :tabclose<CR>
noremap tj :tabprev<CR>
noremap tk :tabnext<CR>
noremap th :tabfirst<CR>
noremap tl :tablast<CR>

" Vim search options.
:set incsearch
:set hlsearch

" Disabling swap files
set noswapfile

" Disabling automatic endline at the end of the file.
" set binary
set noeol

" Creating new line without entering insert mode.
nmap <C-l> o<Esc>

" Replaces word in front with the yanked word and persists yanked word in copy register.
noremap cp viwp

" When vim is resized, rebalance windows
autocmd VimResized * :wincmd =

" NERDTress File highlighting.
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Letting NERDTree open automatically when starting vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree file highlights. It looks super-cool.
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

" Cursor shape config.
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme = 'tomorrow'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1

" Mimic :grep and make ag the default tool.
let g:grepper = {
    \ 'tools': ['ag', 'git', 'grep'],
    \ 'open':  0,
    \ 'jump':  1,
    \ }
nnoremap <leader>git :Grepper -tool git -noswitch<cr>
nnoremap <leader>ag  :Grepper -tool ag  -open -switch<cr>
nnoremap <leader>*   :Grepper -tool ack -cword -noprompt<cr>
