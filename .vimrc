set nocompatible
set rtp+=~/.vim/bundle/vundle/
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set t_Co=256
set hlsearch

call vundle#rc()

let g:ackprg = 'ag --nogroup --nocolor --column'

nnoremap ff :FufFile **/
nnoremap fb :FufBuffer
nnoremap fr :FufRenewCache
nnoremap rs :!bundle exec rspec spec/
nnoremap ac :Ack
nnoremap ag :Ag 

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'slim-template/vim-slim.git'
Bundle 'mileszs/ack.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rking/ag.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nathanaelkane/vim-indent-guides'

syntax enable
colorscheme codeschool

filetype plugin indent on     " required!

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
