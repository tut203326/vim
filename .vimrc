:set enc=utf-8
:set number
:set title
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set cindent
autocmd vimenter * NERDTree
:set showcmd
" :set cursorline "カーソルラインをハイライト
:set wildmenu	"コマンドモードの補完
autocmd BufNewFile,BufRead *.asm set filetype=nasm "asmを開くときはファイルタイプを nasm にする


"dein
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/saito/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/saito/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/home/saito/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" vim-clang
call dein#add('justmao945/vim-clang')
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ –pedantic-errors'

" xterm-color-table.vim
call dein#add('guns/xterm-color-table.vim')


" vim-indent-guides
call dein#add('nathanaelkane/vim-indent-guides')
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=232
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1

