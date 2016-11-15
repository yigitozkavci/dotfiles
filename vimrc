" set nocompatible              " be iMproved, required
filetype off                  " required
set t_Co=256
set term=screen-256color
" set ttyfast
" set lazyredraw
" set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" NERDTree. No explanation is needed.
Plugin 'scrooloose/nerdtree'

" Vim Grepper
Plugin 'mhinz/vim-grepper'

" Finding files with Ctrl+P.
Plugin 'ctrlpvim/ctrlp.vim'

" Language pack.
Plugin 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['elm']

" Elm support for vim
Plugin 'ElmCast/elm-vim'

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

" Allows using custom text objects.
Plugin 'kana/vim-textobj-user'

" Text objects for ruby.
Plugin 'rhysd/vim-textobj-ruby'

" Auto-generates vim end blocks.
Plugin 'tpope/vim-endwise'

" Allows navigating between vim panes like we do in tmux panes.
Plugin 'christoomey/vim-tmux-navigator'

" Go support in vim
Plugin 'fatih/vim-go'

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

" Exit visual mode immediately
:vmap <ESC> <C-c>

" Now, vim and mac shares the same clipboard.
if $TMUX =~ ''
  set clipboard=unnamed
endif

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
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

au FileType go nmap <leader>r <Plug>(go-run)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

noremap <leader>l :GoLint<CR>
noremap <leader>b :GoBuild<CR>
