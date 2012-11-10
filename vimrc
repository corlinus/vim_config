if $TERM =~ 'xterm'
    " ugliest amd most seamless way to make 256 colors work
    set t_Co=256
end

set fileencodings=ucs-bom,utf-8,cp1251

set encoding=utf-8
set background=dark
syntax on
colorscheme desert
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
set statusline=%1*%n\ %*\ %<%f\ %h%=%1*\ %W%Y%R%m\ %*%10(%c\ %l/%L%)\ %2*%P
hi User1 ctermbg=black ctermfg=8 cterm=bold

" show linebreak marker
set cpoptions+=n
set showbreak=»

set ai
set shiftwidth=4
set ts=8
set expandtab
set smarttab
set bs=indent,eol,start

set pt=<F10>
map Y y$

" russian kbd layout
set keymap=russian-jcukenwin
set imi=0
set imsearch=0
imap <C-L> <C-^>
cmap <C-L> <C-^>

" tab remap
map <Tab> >>
map <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv
" thoose above make ^I unusable :( so let's replace it!
noremap g <C-I>

" autoread config
if !exists("autoload_vimrc")
  let autoload_vimrc = 1
  au BufWritePost .vimrc so %
endif

" writing swap file when one second idle, also used by plugins autofollow
set updatetime=1000

" ??
set clipboard=autoselect,unnamed,exclude:cons\|linux
