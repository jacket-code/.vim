runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

color freya                     " 配色

set guioptions-=T               " 删除工具栏
set tabstop=4                   " 设置tab键的宽度
set expandtab                   " 空格代替tab
set shiftwidth=4                " 换行时行间交错使用4个空格
set autoindent                  " 自动对齐
set backspace=2                 " 设置退格键可用
set cindent shiftwidth=4        " 自动缩进4空格
set smartindent                 " 智能自动缩进
set ai                          " 设置自动缩进
set nu                          " 显示行号
set guifont=Monaco              " 设置字体
set showmatch                   " 显示括号配对情况
set hlsearch                    " 开启高亮显示结果
set incsearch                   " 开启实时搜索功能
set nowrapscan                  " 搜索到文件两端时不重新搜索
"set cursorline                 " 突出显示当前行
set hidden                      " 允许在有未保存的修改时切换缓冲区
"set list                       " 显示Tab符，使用一高亮竖线代替
syntax enable                   " 打开语法高亮
syntax on                       " 开启文件类型侦测
filetype plugin indent on       " 针对不同的文件类型加载对应的插件
set nobackup                    " 设置无备份文件
set nocompatible                " 不使用vi兼容的模式
autocmd! bufwritepost .vimrc source ~/.vimrc    " 保存.vimrc文件后自动加载

"------------------------------------------------------
" Ctags配置与快捷键
"------------------------------------------------------
set tags+=~/.vim/tags/stl
set tags+=~/.vim/tags/gl

noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>      
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

"------------------------------------------------------
" 向上或下移动一行或多行
"------------------------------------------------------
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"------------------------------------------------------
"	NERDTree配置
"------------------------------------------------------
"map <silent> <F4> :NERDTreeToggle<CR> "按下F4打开文件浏览器，已经使用winManager整合
let g:NERDTree_title="[NERD Tree]"
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction

"------------------------------------------------------
"	taglist配置
"------------------------------------------------------
"map <F3> :silent! TlistToggle<CR> " 按下F3就可以呼出了，已经使用winManager整合
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let TList_Exit_OnlyWindow=1 " 当taglist是最后一个分割窗口时，自动退出vim

"------------------------------------------------------
"	winManager配置
"------------------------------------------------------
let g:winManagerWindowLayout='NERDTree|TagList' ",BufExplorer [,]表示通过Ctrl+N切换，[|]表示直接显示
let g:winManagerWidth=30
map <silent> <leader>wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

"------------------------------------------------------
" OmniCppComplete配置
"------------------------------------------------------
let OmniCpp_ShowPrototypeInAbbr=1 " 显示函数参数列表
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_MayCompleteDot=1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow=1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope=1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
set completeopt=menu " omnicppcomplete变量预览窗口

"-----------------------------------------------------
" DoxygenToolkit配置
"-----------------------------------------------------
"let g:DoxygenToolkit_briefTag_pre="@Synopsis\t"
"let g:DoxygenToolkit_paramTag_pre="@Param\t"
"let g:DoxygenToolkit_returnTag="@Returns\t"
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_authorName="林国锋（linguofeng@uuzz.com）" 
let g:DoxygenToolkit_licenseTag="Copyright (c) 2012-2013,壹平台客户端 All rights reserved."
