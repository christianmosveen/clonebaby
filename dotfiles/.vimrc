" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" MINE
let mapleader=","

set showmatch
set history=1000
set undolevels=1000
set ruler
syntax on
set hlsearch
filetype on
filetype plugin on
filetype indent on
set binary noeol
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set copyindent
set number
set nowrap
set hidden
set incsearch
set wildignore=*.class,*.pyc
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
colorscheme ir_black
set fileencodings=ucs-bom,utf-8,cp1257,latin1
set enc=utf-8

set shell=/bin/bash
execute pathogen#infect()
highlight clear SignColumn
