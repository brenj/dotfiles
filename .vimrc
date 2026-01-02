" Setup {{{

call plug#begin('~/.vim/plugged')
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'zenbro/mirror.vim'

if !exists('g:vscode')
  Plug 'airblade/vim-gitgutter'
  Plug 'cohama/lexima.vim'
  Plug 'dense-analysis/ale'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'lifepillar/vim-solarized8'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sheerun/vim-polyglot'
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-fugitive'
  Plug 'voldikss/vim-floaterm'
endif

call plug#end()

if !exists('g:vscode')
  colorscheme solarized8
endif

" }}} Setup
" Options {{{

set autoindent                          " auto indenting is on
set backspace=indent,eol,start          " delete autoindent, newlines, etc.
set copyindent                          " copy previous auto indent
set encoding=utf-8                      " set file encoding
set expandtab                           " use spaces when <tab> is pressed
set hidden                              " hide (not close) buffers
set history=1000                        " remember more history
set hlsearch                            " highlight found search terms
set ignorecase                          " ignore case when searching
set incsearch                           " show matches while typing
set shiftround                          " indent by mulitible of shiftwidth
set shiftwidth=4                        " size of the indent is x spaces
set smartcase                           " ignore case when lowercase
set smarttab                            " tabs are only used for indentation
set softtabstop=4                       " simulate tabstop width != tabstop
set tabstop=4                           " a <tab> is equvalent to x spaces
set termguicolors                       " support millions of colors
set undofile                            " keep undo history across restarts
set undolevels=1000                     " increase undo history
set wildmenu                            " better command completion
set wildmode=longest:full,full          " better command completion

if !exists('g:vscode')
  set background=dark                     " set solarized scheme
  set colorcolumn=81                      " show line to enforce 81 char lines
  set completeopt-=preview                " don't show preview window
  set cursorline                          " show a cursor line
  set foldmethod=marker                   " enable folding
  set laststatus=2                        " enable status line
  set lazyredraw                          " only redraw when required
  set list                                " show special characters
  set listchars=tab:..                    " show tab character as .. when used
  set mouse=                              " disable mouse mode
  set nobackup                            " do not save backup files
  set noerrorbells                        " no beeping
  set noswapfile                          " do not create swap files
  set nowrap                              " do not wrap lines
  set number relativenumber               " set number hybrid mode
  set rtp+=/usr/local/opt/fzf             " enable fzf
  set scrolloff=5                         " cursor never hugs the screen edge
  set showcmd                             " show info about the current command
  set showmatch                           " show matching parenthesis
  set showmode                            " show current mode
  set sidescroll=1                        " scroll horizontally by one column
  set sidescrolloff=5                     " cursor never hugs the screen edge
  set signcolumn=yes                      " always show sign column
  set tags+=./tags                        " add path for tag files
  set ttyfast                             " scroll fast in terminal
  set visualbell t_vb=                    " no flashing
endif

" }}} Options
" Colors {{{

if !exists('g:vscode')
  hi FloatermBorder guifg=cyan
  hi GitGutterAdd guifg=green
  hi GitGutterChange guifg=yellow
  hi GitGutterDelete guifg=red
  hi IncSearch guibg=#FBF719
  hi Search guibg=#FBF719
  hi Sneak guifg=white guibg=red
endif

" }}} Colors
" Leaders {{{

let mapleader=","

nnoremap <leader>e :e <c-r>=expand('%:p:h') . '/'<cr>
inoremap <leader>i <esc>
nnoremap <leader><space> :nohlsearch<cr>

if !exists('g:vscode')
  nnoremap <leader>b :Buffers<cr>
  nnoremap <leader>q :q!<cr>
  nnoremap <leader>r :Rg <cr>
  nnoremap <leader>s :w<cr>
  nnoremap <leader>v :edit $MYVIMRC<cr>
  nnoremap <leader>x <c-w>x
  nnoremap <leader>y "*y"
  nnoremap <leader>z :wq!<cr>

  " Coc
  nnoremap <leader>cd <Plug>(coc-definition)
  nnoremap <leader>cr <Plug>(coc-references)

  " FZF
  nnoremap <leader>fs :Files<cr>
  nnoremap <leader>fl :Lines<cr>
  nnoremap <leader>fc :Commits<cr>
  nnoremap <leader>fb :BLines<cr>
  nnoremap <leader>fg :GFiles?<cr>

  " Fugitive
  nnoremap <leader>g? :map <leader>g<cr>
  nnoremap <leader>ga :Gwrite<cr>
  nnoremap <leader>gb :G blame<cr>
  nnoremap <leader>gc :G commit<cr>
  nnoremap <leader>gd :G diff<cr>
  nnoremap <leader>go :Gread<cr>
  nnoremap <leader>gs :G status<cr>
  nnoremap <leader>gw :GBrowse<cr>
  vnoremap <leader>gw :GBrowse<cr>

  " GitGutter
  nnoremap <leader>h? :map <leader>h<cr>
  nnoremap <leader>ha :GitGutterStageHunk<cr>
  nnoremap <leader>hn :GitGutterNextHunk<cr>
  nnoremap <leader>hp :GitGutterPrevHunk<cr>
  nnoremap <leader>hu :GitGutterUndoHunk<cr>
else
  " VS Code + Neovim
  nnoremap <silent> <leader>b :call VSCodeNotify('workbench.action.quickOpen')<cr>
  nnoremap <silent> <leader>q :call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
  nnoremap <silent> <leader>r :call VSCodeNotify('workbench.action.findInFiles')<cr>
  nnoremap <silent> <leader>s :call VSCodeNotify('workbench.action.files.save')<cr>
  nnoremap <silent> <leader>v :call VSCodeNotify('workbench.action.openSettingsJson')<cr>
  nnoremap <silent> <leader>x :call VSCodeNotify('workbench.action.splitEditor')<cr>
  nnoremap <silent> <leader>y :call VSCodeNotify('editor.action.clipboardCopyAction')<cr>
  nnoremap <silent> <leader>z :call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
endif

" Vim window splits
nnoremap <leader><bar> <c-w>v
nnoremap <leader>- <c-w>s
noremap <leader>c <c-w>w
nnoremap <leader>m <c-w>_<c-w><bar>
nnoremap <leader>= <c-w>=

" }}} Leaders
" Remap Keys {{{

" remap ; to : for entering command mode
nnoremap ; :

" remap motion keys for colemak
noremap n h
noremap e l
noremap s k
noremap t j

" next and previous match for incsearch
noremap k n
noremap K N

" jump forwards to the end of a word with punctuation
noremap l E

" delete character and substitute text
noremap h s

" go to beginning and end of line with *strong* motion keys
noremap N ^
noremap E g_

" Sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" Mirror
map <F6> :MirrorPush<CR>

" toggle folding with space
" http://vim.wikia.com/wiki/Folding
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<cr>
vnoremap <space> za

" save a file that requires root privelages AFTER opening
cmap w!! w !sudo tee % >/dev/null

" use <tab> to match parenthesis, brackets, etc...
noremap <tab> %

" use the enter key for coc autocompletion
if !exists('g:vscode')
  inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
endif

" toggle :set paste on for vim only
if !has('nvim') && !exists('g:vscode')
  nnoremap <F2> :if &paste \| set nopaste \| echo "paste: OFF" \| else \| set paste \| echo "paste: ON" \| endif<CR>
endif

" toggle: set mouse for window select
if !exists('g:vscode')
  nnoremap <F3> :if &mouse ==# '' \| set mouse=n \| echo "mouse: NORMAL" \| else \| set mouse= \| echo "mouse: OFF" \| endif<CR>
endif

" }}} Remap Keys
" Plugins {{{

if !exists('g:vscode')

  " Ale
  let g:ale_fixers = {'python': ['black', 'isort']}
  let g:ale_fix_on_save=1
  let g:ale_linters = {
      \ 'dockerfile': ['hadolint'],
      \ 'python': ['flake8'], 'yaml': ['yamllint']
      \ }
  let g:ale_linters_explicit=1
  let g:ale_virtualtext_cursor=0

  " Bufferline
  let g:bufferline_echo=0

  " Coc
  let g:coc_global_extensions = [
      \ 'coc-docker',
      \ 'coc-json',
      \ 'coc-pyright',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-yank',
      \ ]

  " Floaterm
  let g:floaterm_keymap_new='<F7>'
  let g:floaterm_keymap_prev='<F8>'
  let g:floaterm_keymap_next='<F9>'
  let g:floaterm_keymap_toggle='<F12>'
  let g:floaterm_title='($1|$2)'

  " FZF
  let g:fzf_layout = {'down': '~25%'}
  let g:fzf_preview_window = ['right:hidden', 'ctrl-/']
  let $FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

  " GitGutter
  let g:gitgutter_map_keys=0

  " Lightline
  let g:lightline = {'colorscheme': 'solarized'}

  " Solarized
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " UltiSnips
  let g:UltiSnipsSnippetDirectories=["ultisnips-snippets"]
  let g:ultisnips_python_style="sphinx"
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

  " Lexima
  let g:lexima_enable_newline_rules=0
  let g:lexima_enable_endwise_rules=0

endif

" Ripgrep
let $RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "

" Sneak
let g:sneak#s_next=1
let g:sneak#label=1

" }}} Plugins
" Auto Commands {{{

if has("autocmd")
  " Jinja2 templates
  au BufNewFile,BufRead *.jinja2 setfiletype html
  " Reload config on save
  au BufWritePost $MYVIMRC source $MYVIMRC
  " netrw keymaps (terminal Vim/Neovim only)
  if !exists('g:vscode')
    au FileType netrw call Netrw_Maps_For_Colemak()
  endif
endif

" }}} Auto Commands
" Functions {{{

function! Netrw_Maps_For_Colemak()
    noremap <buffer> n h
    noremap <buffer> e l
    noremap <buffer> s k
    noremap <buffer> t j
endfunction

" }}} Functions
