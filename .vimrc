set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set t_Co=256
set hlsearch
set noswapfile
set nobackup
set background=dark
set backspace=indent,eol,start
set fileencodings=utf-8,sjis,euc-jp,latin1
set clipboard=unnamed

nnoremap ff :FufFile **/
nnoremap fb :FufBuffer
nnoremap fr :FufRenewCache
nnoremap ag :Ag 
vnoremap * "zy:let @/ = @z<CR>n

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
imap <c-j> <esc>
imap <c-b> <Left>
imap <c-f> <Right>
imap <c-h> <BackSpace>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'slim-template/vim-slim.git'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'rking/ag.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-scripts/c.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'tomtom/tcomment_vim'
Plugin '29decibel/codeschool-vim-theme'
Plugin 'Shougo/vimproc.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'digitaltoad/vim-pug'
Plugin 'itmammoth/doorboy.vim'
Plugin 'prettier/vim-prettier'
Plugin 'sbdchd/neoformat'
Plugin 'leafgarland/typescript-vim'

call vundle#end()

syntax enable
colorscheme codeschool

filetype plugin indent on     " required!

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
au BufRead,BufNewFile,BufReadPre *.es6   set filetype=javascript
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync

" unite.vim
let g:unite_enable_start_insert=1
noremap <C-G> :Unite file_rec/git<CR>
noremap <C-B> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

let mapleader = "\<Space>"
"let mapleader = ","
"let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'
let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'
noremap \  ,
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
nnoremap<Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" vim-quickrun
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['ruby.rspec'] = { 'command': 'rspec', 'cmdopt': 'bundle exec', 'exec': '%o %c %s' }
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" set textwidth=80
" set colorcolumn=+1
" hi ColorColumn guibg=#2d2d2d ctermbg=232

" ctags
map <Leader>rt :!ctags --tag-relative --extra=+f -Rf.git/tags --exclude=.git,pkg -languages=-javascript,sql<CR><CR>

" terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

set tags+=.git/tags
