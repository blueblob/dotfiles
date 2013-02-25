" General options {{{1

filetype plugin on
filetype plugin indent on
syntax on
set foldmethod=syntax

:colors vibrantink
set autoindent
set background=dark
set backspace=indent,eol,start    " allow backspace over anything in insert mode
set nocompatible

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::

set dictionary+=/usr/share/dict/words
set expandtab

set equalalways "automatically resize open windows
set foldlevelstart=99
set hlsearch
set ignorecase
set incsearch
set matchtime=2
set mousemodel=popup
set nojoinspaces
set number
set showcmd        " display incomplete commands
set showfulltag    " show prototype when completing words using tags file
set showmatch
set smarttab
set smartindent
set shiftwidth=4
set nostartofline
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.class
set title
set ttyfast        " we have a fast terminal connection
set ttyscroll=3
set visualbell
set wildmenu
set wildmode=list:longest
set mouse=a

autocmd BufNewFile,Bufread *.h,*.cpp,*.cc,*.c,*.hpp setfiletype cpp
autocmd BufNewFile,Bufread *.jad setfiletype java
autocmd BufNewFile,Bufread *.jspf setfiletype jsp
" cause javaclassfile.vim ftplugin to be executed, which uses jad
" to decompile and display on the fly
autocmd BufNewFile,Bufread *.class setfiletype javaclassfile
" autocmd BufNewFile *.pl 0r ~/.vim/templates/newperlfile

autocmd BufNewFile *.java call NewJavaFileTemplate()
function s:NewJavaFileTemplate()
  " inserts boilerplate code for a new Java file
  execute "normal iclass \%\\ {\public static void main(String args[]) {\}\}\kk"
endfunction

let g:html_tag_case = 'lowercase'

" see ':he last-position-jump'
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


let g:is_bash = 1

" don't read .gvimrc
set secure

" Run .r or .R programs when saving
au BufWritePost *.r,*.R !Rscript %


set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

set viminfo='100,h
set laststatus=2
call pathogen#infect()
let g:Powerline_symbols = 'fancy'
hi Normal ctermbg=black ctermfg=white
set backupdir=~/.vim/backup
