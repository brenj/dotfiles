" ~/.config/nvim/init.vim

" Reuse Vim config
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" pyenv root
let $PYENV_ROOT = expand('~/.pyenv')

" Python host
let g:python3_host_prog = expand('~/.pyenv/versions/3.10.10/bin/python3')

" Silence unused providers
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

source ~/.vimrc
