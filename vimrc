set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-markdown'
Plugin 'Lokaltog/vim-powerline'
Plugin 'bogado/file-line'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
" rust
Plugin 'rust-lang/rust.vim'
" go lang
Plugin 'fatih/vim-go'
" ruby
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ngmy/vim-rubocop'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

if $TERM =~ 'xterm'
    " ugliest amd most seamless way to make 256 colors work
    set t_Co=256
end

set fileencodings=ucs-bom,utf-8,cp1251
set guioptions-=T

set encoding=utf-8
set background=dark
syntax on
colorscheme railscasts
filetype plugin indent on

set number
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
set ts=4
set expandtab
set smarttab
set bs=indent,eol,start

set pt=<F9>
nnoremap Y y$

" convert quotation marks
nnoremap <leader>w m`f'r"F'r"``
nnoremap <leader>W m`f"r'F"r'``

nnoremap <Space> za
vnoremap <Space> za

nnoremap <leader>m :RTmigration<cr>
nnoremap <leader>r :RuboCop -D<cr>

" russian kbd layout
set keymap=russian-jcukenwin
set imi=0
set imsearch=0
inoremap <C-L> <C-^>
cnoremap <C-L> <C-^>

" folding level
setlocal foldlevelstart=99

" highlight long strings
" highlight OverLength ctermbg=darkred guibg=#592929
" match OverLength /\%101v.\+/

function! UseRubyIndent ()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
    setlocal number
    setlocal foldmethod=syntax

endfunction

function! ErubyAbbrs ()
    "iabbrev <% <% %><left><left><left>
    "iabbrev <%- <%- %><left><left><left>
    iabbrev <buffer> <%> <% end %>
endfunction

augroup my_ft_autocmds
    autocmd!
    autocmd FileType yml,yaml,ruby,eruby,coffee,cucumber call UseRubyIndent()
    autocmd FileType eruby call ErubyAbbrs()
    "abbrevs
    autocmd FileType ruby,eruby iabbrev #R Rails.logger.debug "\n#{">"*100}\n#{}\n#{">"*100}\n"<ESC>15<Left>i
    autocmd FileType ruby,eruby iabbrev #b binding.pry

    autocmd FileType xslt set ts=2 sw=2

    " comment mappings
    " TODO
    "autocmd FileType vim nnoremap <buffer> m`^i" <esc>``
augroup END

" tab remap
map <Tab> >>
map <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv
" thoose above make ^I unusable :( so let's replace it!
noremap g <C-I>

" maps
map <leader>. :vsplit $MYVIMRC<cr>
"map <leader><leader> :NERDTreeToggle<cr>
map <leader><leader> :NERDTreeFind<cr>

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
au BufNewFile,BufRead *.xlsx.axlsx setf ruby
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.jbuilder setf ruby

" ctrl_p config
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn|bundle)|(tmp|public\/system|public\/uploads))$'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" external config
"set grepprg=git\ grep\ -n\ $*\

set clipboard=unnamed
