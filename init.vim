" dein settings {{{
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let g:rc_dir = expand("~/.config/nvim/")
  let s:toml = g:rc_dir . '.dein.toml'
  let s:lazy_toml = g:rc_dir . '/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
"call dein#update and  call dein#clear_state 
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif
" }}}


" enable true color
set termguicolors
colorscheme tender


""" copy from .vimrc
set nocompatible "viとの互換性をなくす"
set autoindent "改行時に前の行のインデントを継続する"
set smartcase "改行時にスマートなインデントを行う"
autocmd FileType * setlocal formatoptions-=ro " 改行時のシャープを無効
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが>動く幅"
set hlsearch "検索時ハイライト
set number "行番号表示"

"スワップファイルを作らない"
set noswapfile

"syntax enable

set tabstop=4 "<tab>が対応する空白の数"
set showmatch "対応する括弧を表示"
set shiftwidth=4
set expandtab
"""""""""""""""""""""""""

""" for vim-latex"" Vim-LaTeX
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_dvi = 'platex --shell-escape -synctex=1 -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_BibtexFlavor = 'pbibtex'
let g:Tex_MakeIndexFlavor = 'mendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_dvi = 'pxdvi -watchfile 1'
let g:Tex_ViewRule_ps = 'gv --watch'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_AutoFolding = 0
let g:Tex_IgnoredWarnings =
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \"Font shape \`JT1/gt/m/it\' undefined"."\n".
    \"Font shape \`JY1/gt/m/it\' undefined"."\n".
    \"Font shape \`JT1/mc/m/it\' undefined"."\n".
    \"Font shape \`JY1/mc/m/it\' undefined"."\n".
    \'LaTeX Font Warning: Some font shapes were not available, defaults substituted.'
let g:Tex_IgnoreLevel = 12
""""""""""""""""""

"Cで括弧の補完"
au BufNewFile,BufRead *.c inoremap {<Enter> {}<Left><CR><ESC><S-o>

"C++で括弧の補完"
au BufNewFile,BufRead *.cpp inoremap {<Enter> {}<Left><CR><ESC><S-o>
