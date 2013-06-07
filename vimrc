call pathogen#infect()

if $TERM =~ 'xterm'
    " ugliest amd most seamless way to make 256 colors work
    set t_Co=256
end

"abbrevs
iabbrev #R Rails.logger.debug "\n#{">"*100}\n#{}\n#{">"*100}\n"<ESC>15<Left>i

set fileencodings=ucs-bom,utf-8,cp1251

set encoding=utf-8
set background=dark
syntax on
"colorscheme desert
colorscheme railscasts
filetype plugin indent on

set shortmess+=I
set incsearch
set ignorecase smartcase
set hlsearch
set noequalalways
set confirm
set wildmenu
set linebreak
set virtualedit=block
set nojoinspaces
set switchbuf=usetab
set laststatus=2
set history=200
"set statusline=%1*%n\ %*\ %<%f\ %h%=%1*\ %W%Y%R%m\ %*%10(%c\ %l/%L%)\ %2*%P
hi User1 ctermbg=black ctermfg=8 cterm=bold

" display tabs and trailing spaces
set list
set listchars=tab:→-,extends:»,precedes:«,trail:•

" TODO remove trailing whitespaces on file save
"autocmd BufWritePre * :%s/\s\+$//e

" show linebreak marker
set cpoptions+=n
set showbreak=»

set ai
set shiftwidth=4
set ts=8
set expandtab
set smarttab
set bs=indent,eol,start

set pt=<F9>
map Y y$

" russian kbd layout
set keymap=russian-jcukenwin
set imi=0
set imsearch=0
imap <C-L> <C-^>
cmap <C-L> <C-^>

function! UseRubyIndent ()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
    set number
endfunction

autocmd FileType ruby,eruby call UseRubyIndent()

" tab remap
map <Tab> >>
map <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv
" thoose above make ^I unusable :( so let's replace it!
noremap g <C-I>

" maps
map <leader>. :split $MYVIMRC<cr>

" autoread config
if !exists("autoload_vimrc")
  let autoload_vimrc = 1
  au BufWritePost .vimrc so %
endif

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" writing swap file when one second idle, also used by plugins autofollow
set updatetime=1000

" ??
set clipboard=autoselect,unnamed,exclude:cons\|linux

au BufNewFile,BufRead *.haml.deface setf haml
au BufNewFile,BufRead *.erb.deface setf eruby
