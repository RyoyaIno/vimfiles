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
"set statusline+=%<%F "ファイル名表示
"set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}] "文字コード表示
"set statusline+=%r "読込専用かどうか表示
"set statusline+=%= "以下ツールバー右側
"set statusline+=[行%l/%L] "現在文字行/全体列表行
"set statusline+=[列%c/%{col('$')-1}] "現在文字列/全体列表示

"##### プラグイン #####
filetype plugin indent off
if has('vim_starting')
	if &compatible
		set nocompatible
	endif
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" ##### 非同期通信処理#####
NeoBundle 'Shougo/vimproc'

"##### ディレクトリツリー表示 #####
NeoBundle 'scrooloose/nerdtree'

"##### カッコ自動閉じ#####
NeoBundle 'Townk/vim-autoclose'

"##### 補間機能 #####
NeoBundle 'Shougo/neocomplete'
"NeoBundle 'Shougo/neocomplcache'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"##### neosnippet #####
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
"For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

"##### neocomplete-php #####
NeoBundle 'violetyk/neocomplete-php'
let g:neocomplete_php_locale = 'ja'

"##### 文法チェック #####
NeoBundle 'scrooloose/syntastic'
"Recommended settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"Auto check
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {'mode': 'passive'} 
augroup AutoSyntastic
    autocmd!
	autocmd InsertLeave,TextChanged *.php,*.rb,*.js,*.java,*.c,*.cpp call s:syntastic() 
augroup END
"ノーマルモードに移行時の処理
function! s:syntastic()
	"w
    SyntasticCheck
	call lightline#update()
endfunction

NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ],
	\			  [ 'figitive', 'readonly', 'filename', 'modified', 'syntastic' ]]
	\ },
	\ 'component': {
	\   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
	\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
	\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
	\ },
	\ 'component_expand': {	
	\	'syntastic': 'SyntasticStatuslineFlag'
	\  },
	\ 'component_type': {
	\ 	'syntastic': 'error'
	\ }
	\ }
augroup reload_vimrc
	autocmd!
	autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup end

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
