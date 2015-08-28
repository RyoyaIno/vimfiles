"##### 基本設定 #####
set encoding=utf-8 "文字コード設定
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8 "自動文字コード識別
set number " 行番号表示
set title " ターミナルのタイトルセット
set showmatch " かっこの一致を強調
set hidden " ファイル保存なしで別ファイルを開ける
syntax on "コードの色分け
set tabstop=4 " タブ幅
set smartindent " オートインデント

" Cursor movement
set whichwrap=b,s,<,>,[,] " 行頭行末のカーソル移動
set virtualedit=block " 文字のないところにカーソル移動
set backspace=indent,eol,start " バックスペースをどこでも使えるように

"vi off
set nocompatible

"##### Neobundle #####
filetype plugin indent off
if has('vim_starting')
	if &compatible
		set nocompatible
	endif
	set runtimepath+=~/vimfiles/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/vimfiles/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" My Bundles here:
NeoBundle 'Shougo/vimproc'
NeoBundle 'scrooloose/nerdtree'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
