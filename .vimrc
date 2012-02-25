" vi互換モードをOFF
set nocompatible

"外部で変更のあったファイルを自動的に再読み込み
set autoread

" Vim起動時のメッセージを表示しない
:set shortmess+=I

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"swapファイルをまとめて置く場所(DropBox対策)
set swapfile
set directory=~/.vimswap

" バックアップしない
set nobackup

" show line numbers
set number

" テーマ設定
syntax enable
set background=dark
"set t_Co=256
"let g:solarized_termcolors = 16
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
colorscheme solarized

"let g:molokai_original = 1
"colorscheme molokai

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"特殊文字(SpecialKey)の見える化。listcharsはlcsでも設定可能。
"trailは行末スペース。
"set list
"set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

"set autoindent smartindent       " プログラミング用に自動インデントする
set cindent

" タブ
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 直前の単語を大文字に
" http://d.hatena.ne.jp/h1mesuke/20100905/p1
inoremap <C-g><C-u> <ESC>gUiw`]a

" 文字コード自動認識
:set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" ディレクトリ内からtagsファイルを再帰的に検索する
set tags+=tags;
" タグジャンプしたあとにrecenter
nnoremap <silent> <C-]> <C-]>zz
nnoremap <silent> <C-T> <C-T>zz

" カレントディレクトリを自動的に現在のバッファのディレクトリに切り替える
set autochdir

" 自動改行なし
set textwidth=0

"折り返し位置を色付け
if exists('&colorcolumn')
    set colorcolumn=+1
	" sh,cpp,perl,vim,...の部分は自分が使う
	" プログラミング言語のfiletypeに合わせてください
	autocmd FileType sh,cpp,perl,vim,ruby,python,haskell,scheme setlocal textwidth=80
endif

" Ctrl-hjklでウィンドウを移動
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Search -------------------------------
set wrapscan				" 最後まで検索したら先頭へ戻る
set ignorecase				" 大文字小文字無視
set smartcase				" 大文字ではじめたら大文字小文字無視しない
set incsearch				" インクリメンタルサーチ
set nohlsearch				" 検索文字をハイライトしない

" サーチハイライトトグル
nnoremap <silent> <Space>h :set hlsearch!<CR>

" 自動保存
set autowrite
" set autowriteall

"autocmd CursorHold *  wall
"autocmd CursorHoldI *  wall

" show useful information on status line
set statusline=%t\ %m%r%h%w[%Y][%{&fenc}:%{&ff}]%=%c,%l%11p%%

" .vimrcを読み込むたびに以下の設定がリセットされてしまうので、ここにも書いておく。
" MacVimのvimrcからコピペしてきた。
if has('multi_byte_ime') || has('xim') || has('gui_macvim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neobundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent off     " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" let NeoBundle manage NeoBundle
" required!
NeoBundle 'Shougo/neobundle.vim'
" recommended to install
NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'

" My Bundles here:
"
" original repos on github
NeoBundle 'mileszs/ack.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'Raimondi/delimitMate'    有効にすると日本語変換中にエンターで改行されてしまう
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'c9s/perlomni.vim'
"NeoBundle 't9md/vim-unite-ack'
" vim-scripts repos
NeoBundle 'sudo.vim'
" non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

filetype plugin indent on     " required!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" unite.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space> [unite]
" 入力モードで開始する
let g:unite_enable_start_insert=1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 200
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"ブックマーク一覧
nnoremap <silent> [unite]b :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" buffer and file_mru
nnoremap <silent> [unite]j :<C-u>Unite -buffer-name=files buffer file_mru bookmark<CR>
" find project
nnoremap <silent> [unite]t :<C-u>call <SID>unite_project('-start-insert')<CR>
" outline
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
" register
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
 "grep project
nnoremap <silent> [unite]p :<C-u>call <SID>unite_grep_project('')<CR>
" perldoc
nnoremap <silent> [unite]d:<C-u>Unite ref/perldoc<CR>
" インクリメンタルサーチ中にUnite line
cnoremap <expr> <C-o>  getcmdtype() == '/'
            \ ? '<Esc>:<C-u>nohlsearch\|exe "Unite -input=" . escape(@/," ") . " line:forward"<CR>'
            \ : getcmdtype() == '?'
            \ ? '<Esc>:<C-u>nohlsearch\|exe "Unite -input=" . escape(@/," ") . " line:backward"<CR>'
            \ : "\<C-o>"

" occur(=Unite lines) forward/backward
nnoremap ]o :UniteWithCursorWord line:forward<CR>
nnoremap [o :UniteWithCursorWord line:backward<CR>

" For optimize.
let g:unite_source_file_mru_filename_format = ''


" unite.vimだけで有効なマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	" ESCでuniteを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
	"入力モードのときctrl+wでバックスラッシュも削除
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"ctrl+sで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
	"ctrl+vで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
	" file_recはキャッシュを持つため、キャッシュを削除
	nmap <buffer> <C-C> <Plug>(unite_redraw)
	imap <buffer> <C-C> <Plug>(unite_redraw)
endfunction

" .git等があるディレクトリからfire_recするsourceを付加したuniteを呼び出す
function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite' opts ' -buffer-name=files file_rec/async:' . dir 
endfunction

let g:unite_source_file_rec_ignore_pattern = '\%(\.cpan\|\.git\|\.subversion\|\.vim\|\.bin\|/data/\)'

function! s:unite_grep_project(...)
  let pattern = input("Pattern: ")
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  "execute 'Unite' opts ' grep:' . ':-i:' . pattern . ' /Volumes/centos/home/moba/conf /Volumes/centos/home/moba/pm /Volumes/centos/home/moba/template'
  execute 'Unite' opts ' grep:' . dir . '::' . pattern
endfunction

" For ack.
if executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color --type=perl'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vimfiler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimfilerをデフォルトにする
:let g:vimfiler_as_default_explorer = 1
" Edit file by tabedit.
"let g:vimfiler_edit_action = 'tabopen'
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

nnoremap <Leader><leader> :VimFiler<CR>
aug VimFilerKeyMapping
    au!
    autocmd FileType vimfiler call s:vimfiler_local()

    function! s:vimfiler_local()
        " キーマップのカスタマイズ
		nmap <buffer> <C-l> <C-w>l
		nmap <buffer> <C-j> <C-w>j
    endfunction
aug END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" neocomplcache
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
    "\ 'default' : '',
    "\ 'perl' : $HOME . '/.vim/dict/perl.dict',
    "\ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
    "\ 'scala' : $HOME . '/.vim/dict/scala.dict'
    "\ }

"Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"imap <expr><TAB> pumvisible() ? "\<C-n>" : neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#close_popup() . "<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType perl set omnifunc=perlcomplete#CompletePERL

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ユーザー定義スニペット保存ディレクトリ
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
"スニペットファイルを編集する
nnoremap <Space>es :NeoComplCacheEditSnippets 
