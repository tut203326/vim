:set enc=utf-8
:set number
:set title
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set cindent
:set showcmd
:set incsearch	"インクリメンタル検索
" :set cursorline "カーソルラインをハイライト(_が見えづらくなる)
:set wildmenu	"コマンドモードの補完
:set hlsearch

"~~挿入モード~~
"カッコの補完<CR>はenterのこと
inoremap { {}<LEFT>
inoremap {<Enter> {}<LEFT><Enter><ESC><S-o>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
" Ctrl+wを無効(前の単語の消去)
inoremap <C-w> <nop> 

"~~ノーマルモード~~
"右端と左端
noremap <C-h> ^
noremap <C-l> $	
"ノーマルモードでBSを押した場合、挿入モードでのBSを同じにする
noremap <BS> i<BS><ESC>l
noremap J <nop>
noremap K <nop>
noremap w <C-w>
noremap <Enter> o<ESC>


autocmd VimEnter * NERDTree
"新しくタブを開いたときNERDTreeを開く(普通にやるとうまく行かないから、タイマーを使用)
"autocmd TabNew * call timer_start(0, { -> execute('NERDTree') })
autocmd BufWinEnter * NERDTreeMirror

autocmd BufNewFile,BufRead *.nas set filetype=nasm "nasを開くときはファイルタイプを nasm にする
autocmd BufNewFile,BufRead *.asm set filetype=nasm "asmを開くときはファイルタイプを nasm にする
autocmd BufRead * hi Comment ctermfg=darkgray

"dein
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$HOME/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

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

" NERDTree
call dein#add('preservim/nerdtree')

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

" deoplete
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1

