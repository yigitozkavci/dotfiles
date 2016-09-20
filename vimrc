set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize.
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
" Ruby on Rails tools.

Plugin 'tpope/vim-rails'
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

" All of your Plugins must be added before the following line.
call vundle#end()            " required

filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete
:syntax on

" Display Line Numbers.
:set number

" Tab Config
:set expandtab
:set tabstop=2
:set shiftwidth=2

" Now, vim and mac shares the same clipboard.
set clipboard=unnamed

" Custom Mappings.
map <S-E> :NERDTreeToggle <CR>
map <C-U> 10j
map <C-I> 10k
map <C-A> <C-W>h
map <C-D> <C-W>l
map _ <C-Y>,i
map <C-n> :set relativenumber <CR>
map <C-b> :set norelativenumber <CR>
let vim_markdown_preview_hotkey='<C-m>'

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

" Creating new line without entering insert mode.
nmap <C-O> o<Esc>

" Replaces word in front with the yanked word and persists yanked word in copy register.
noremap cp viwp

" NERDTress File highlighting.
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" My first good mapping, yay!
nnoremap K :grep! -r <C-R><C-W> .<CR>

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <tab> <c-r>=Smart_TabComplete()<CR>

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
