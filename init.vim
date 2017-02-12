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
" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update や call dein#clear_state を呼んでください。
" vimprocだけは最初にインストールしてほしい
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
"colorscheme hybrid

set tabstop=4 "<tab>が対応する空白の数"
set showmatch "対応する括弧を表示"
set shiftwidth=4
set expandtab

