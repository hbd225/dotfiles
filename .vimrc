set nocompatible
set rtp+=~/.vim/bundle/vundle/
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set t_Co=256
set hlsearch
set noswapfile
set nobackup

call vundle#rc()

nnoremap ff :FufFile **/
nnoremap fb :FufBuffer
nnoremap fr :FufRenewCache
nnoremap rs :!bundle exec rspec spec/
nnoremap ag :Ag 

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'slim-template/vim-slim.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'rking/ag.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'elixir-lang/vim-elixir'
Bundle 'vim-scripts/c.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'tomtom/tcomment_vim'

syntax enable
colorscheme codeschool

filetype plugin indent on     " required!

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

" unite.vim
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
