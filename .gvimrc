" カラー設定
" (.vimrc に指定してもデフォルトの gvimrc に上書きされてしまうので)
colorscheme torte

"---------------------------------------------------------------------------
" GUI 設定開始
gui

" 半透明にする
if has('gui_macvim')
  set transparency=20
else
  set transparency=200
endif

" 画面の設定
"" メニューバーを表示しない
"set guioptions-=m
"" ツールバーを表示しない
set guioptions-=T
"" 左スクロールバーを表示しない
set guioptions-=l
set guioptions-=L
"" 右スクロールバーを表示しない
set guioptions-=r
set guioptions-=R
"" 下スクロールバーを表示しない
set guioptions-=b

" 行番号を表示する
"set number
"" 非表示にするときは set nonumber

" フォント設定
if has('win32')
  " Windows用
  set guifont=MS_Gothic:h12:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  "set guifont=Consolas:h12:cSHIFTJIS
  "set guifont=Consolas:h11
endif

"---------------------------------------------------------------------------
