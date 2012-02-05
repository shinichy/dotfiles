let g:molokai_original = 1
set t_Co=256
colorscheme molokai
set guifont=Ricty:h14

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
