if has("gui_macvim")
	set transparency=4
	set guioptions-=T "egmrt
  "for macvim
  set guifont=Monaco:h12.5
endif

 "for linux gvim
 "set guifont=Monaco\ 11
" set guifont=Consolas\ 13
 " set guifontwide=WenQuanYi\ Zen\ Hei:h12:cGBK
 " 设定文件浏览器目录为当前目录
 set bsdir=buffer
 " 设置编码
 set enc=utf-8
 " 设置文件编码
 set fenc=utf-8
 " 设置文件编码检测类型及支持格式
 set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
 "显示行号
 set number
 " 查找结果高亮度显示
 set hlsearch
 " 不自动换行(否：wrap)
 set nowrap
 " 缺省不产生备份文件
 set nobackup
 " 不要生成swap文件，当buffer被丢弃的时候隐藏它
 setlocal noswapfile
 set noswapfile
 "在输入命令时列出匹配项目
 set wildmenu
 "开启右下角光标位置显示
 set ruler
 " tab宽度
 set tabstop=2
 set expandtab
 set cindent shiftwidth=2
 set autoindent shiftwidth=2
 " 自动保存
 au BufLeave,FocusLost * silent! w
 "call pathogen#infect()
 " 设置开启语法高亮
 syntax on

" ------------------- Vundle config -------------------------------------------
 "vundle
 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tomasr/molokai'
 Bundle 'Shougo/neocomplcache'
 Bundle 'scrooloose/nerdtree'
 Bundle 'jistr/vim-nerdtree-tabs'
 "Bundle 'vim-scripts/taglist.vim'
 Bundle 'majutsushi/tagbar'
 "Bundle 'vim-scripts/jsbeautify'
 Bundle 'ekevin/jsbeautify'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'pangloss/vim-javascript'
 Bundle 'tpope/vim-markdown'
 Bundle 'tpope/vim-rails'
 Bundle 'Lokaltog/vim-powerline'
 Bundle 'kien/ctrlp.vim'
 Bundle 'othree/html5.vim'
 Bundle 'scrooloose/syntastic'
 Bundle 'scrooloose/nerdcommenter'
 Bundle 'Lokaltog/vim-easymotion'
 "Bundle 'jelera/vim-javascript-syntax'
 Bundle 'hail2u/vim-css3-syntax'
 Bundle 'tpope/vim-fugitive'
 "Bundle 'samsonw/vim-task'
 "Bundle 'kana/vim-smartinput'

 " vim-scripts repos
 "Bundle 'FuzzyFinder'
 " non github repos
 "Bundle 'git://git.wincent.com/command-t.git'

 filetype plugin indent on     " required! 
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 " ------------------- Vundle config end --------------------------------------------
 
 " -- NERDTree ------------
 let g:NERDTreeWinSize = 28
" 把 F8 Alt+o映射到 启动NERDTree插件
 map <F8> :NERDTreeTabsToggle<CR>
 "map <M-o> :NERDTreeToggle<CR>
 map <M-o> :NERDTreeTabsToggle<CR>
 let g:nerdtree_tabs_open_on_gui_startup = 0
 " -- NERDTree end ------------

" 把 CTRL-S 映射为 保存
 imap <C-S> <C-C>:w<CR>
 map :W :w<CR>
 map <M-s> :w<CR>
"my configure,F3 F4 switch the tablabel
map ^T :tabnew .<CR>
"map <F3> :tabprevious<CR>
map <M-j> :tabprevious<CR>
map <M-1> :tabprevious<CR>
"map <F4> :tabnext<CR>
map <M-k> :tabnext<CR>
map <M-2> :tabnext<CR>
map <F5> :tabnew<CR>
map <M-n> :tabnew<CR>
"映射F6执行ruby文件
map <F6> :!ruby %<CR>
"映射F7执行nodeJS文件
map <F7> :!node %<CR>
"映射<F12> 关闭当前窗口
map <F12> :q!<CR>
map <M-b> :q!<CR>

"-- neocomplcache. ----------- 
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase. 
let g:neocomplcache_enable_smart_case = 1 
" Use camel case completion. 
"let g:neocomplcache_enable_camel_case_completion = 1 
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Enable omni completion. 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 
" Enable heavy omni completion. 
if !exists('g:neocomplcache_omni_patterns') 
	let g:neocomplcache_omni_patterns = {} 
endif 
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" <CR>: close popup and save indent.
 inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion. 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>" 
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
"-- neocomplcache end -------

" command-t
"if has("gui_macvim")
 " macmenu &File.New\ Tab key=<nop>
  "map <D-t> :CtrlP<CR>
  "map <D-t> :CommandT<CR>
  "macmenu &File.New\ Tab key=<D-S-t>
"endif

"-- ctrlp --------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
set wildignore+=*/node_modules/*  " node module 
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 15
let g:ctrlp_extensions = ['buffertag']
"---- ctrlp -------- end --


:filetype plugin on
:colorscheme molokai
set term=xterm-256color
set t_Co=256

"自动切换工作目录
"set autochdir

"-- ctags ---------------
"let g:tlist_javascript_settings = 'javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'
let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"不同时显示多个文件的tag，只显示当前文件v的
let Tlist_Show_One_File = 1            
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1          
"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1          
"
"-- coffee -------------
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

"-- syntastic -------------
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checker='jshint'
