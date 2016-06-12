"Ctrl+nでNERDTreeの起動
nnoremap <silent><C-n> :NERDTree<CR>
"Control+jでescape
inoremap <C-j> <esc>
vnoremap <C-j> <esc>
"Shit+←or→でVisiualモードへ
inoremap <S-Left> <esc>v
inoremap <S-Right> <esc>v
nnoremap <S-Left> <esc>v
nnoremap <S-Right> <esc>v

"##### 基本設定 #####
set number " 行番号表示
set title " ターミナルのタイトルセット
set showmatch " かっこの一致を強調
set hidden " ファイル保存なしで別ファイルを開ける
set autoread "内容が変更されたら自動的に再読込
syntax on "コードの色分け

"##### 文字コード #####
set encoding=utf-8 "文字コード設定
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8 "自動文字コード識別

"##### インデント #####
set tabstop=4 " タブ幅
set autoindent " オートインデント
set expandtab
set shiftwidth=4 "インデントする文字数
set list
set listchars=tab:>_,trail:_,eol:↲,extends:>,precedes:<

"##### カーソル #####
"set cursorline "カーソルラインの表示
set whichwrap=b,s,<,>,[,] " 行頭行末のカーソル移動
set virtualedit=block " 文字のないところにカーソル移動
set backspace=indent,eol,start " バックスペースをどこでも使えるように

"##### バックアップ場所 #####
"set directory=~/.vim
"set backupdir=~/.vim
"set undodir=~/.vim
set noswapfile "swpファイルを生成しない"
set nobackup "バックアップを取らない

"##### 検索 #####
set incsearch "インクリメンタルサーチを有効に
set hlsearch "検索結果をハイライト

"##### マウス #####
if has ("mouse")
	set mouse=a "マウスを使用可能に
	set guioptions+=a
	set ttymouse=xterm2
endif

"##### PHP #####
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let g:sql_type_default='mysql'

"##### ステータスバー#####
set showcmd "ステータスラインにコマンド表示
set laststatus=2 "ステータスラインを常に表示
set statusline+=%<%F "ファイル名表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}] "文字コード表示
set statusline+=%r "読込専用かどうか表示
set statusline+=%= "以下ツールバー右側
set statusline+=[行%l/%L] "現在文字行/全体列表行
set statusline+=[列%c/%{col('$')-1}] "現在文字列/全体列表示
