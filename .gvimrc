colorscheme solarized
set background=dark
"set background=light
"let g:molokai_original = 1
"set t_Co=256
"colorscheme molokai
set guifont=Ricty:h14

set nohlsearch				" 検索文字をハイライトしない
set antialias               " アンチエイリアシング
set transparency=3          " 半透明
set guioptions-=T           " ツールバー削除

" カーソル点滅無効化
set guicursor=a:blinkon0

" ウィンドウ
set sessionoptions+=resize " 行・列を設定する

if hostname() == 'shinichi-mac.local'
  set lines=48             " 行数
  set columns=160          " 横幅
else
 " setting for iMac
endif

set cmdheight=1            " コマンドラインの高さ
set previewheight=5        " プレビューウィンドウの高さ

set splitbelow             " 横分割したら新しいウィンドウは下に
set splitright             " 縦分割したら新しいウィンドウは右に
set showtabline=2          " タブを常に表示

if has('multi_byte_ime') || has('xim') || has('gui_macvim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
