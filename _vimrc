syntax enable
syntax on
colorscheme desert
"colorscheme darkburn

set ignorecase

set showcmd
set showmode

set incsearch
set hlsearch

set number
set mouse=a

set showmatch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set cindent

set cursorline

"======== ctags setting =========
" press F8 for running ctags -R and update taglist
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q <CR>
set tags=tags;

"======== taglist setting ========
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=1
let Tlist_WinWidth=30

map tl :TlistToggle<CR>

"==========NerdTree setting =======
map nt :NERDTreeToggle<CR>

"======== WinManager setting ======
"let g:winManagerWindowLayout='FileExplorer'
"nmap wm :WMToggle<CR>

"======== cscope setting ========
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	if filereadable("cscope.out")
		cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

	set csverb
endif

map <F4> :cs add ./cscope.out .<CR><CR> :cs reset<CR>

nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"================quickfix============================
nmap cn :cn<CR>
nmap cp :cp<CR>
nmap cc :cclose<CR>

"================A setting ==================
nnoremap <F2> :AS<CR>

"================Grep setting ======================
nnoremap <F3> :Grep<CR>


"========== new omni completion setting ============
filetype plugin indent on
filetype on
set completeopt=longest,menu

let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

"================ SrcExpl setting ====================
nmap <F5> :SrcExplToggle<CR>
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refresfTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"

"// In order to Avoid conflicts, the Source Explorer should know what plugins
"// are using buffers. And you need add their buffer names into below list 
"// according to the command ":buffers!"                                      " 
let g:SrcExpl_pluginList = [
\"__Tag_List__",
\"_NERD_tree_",
\"Source_Explorer"
\]
let g:SrcExpl_isUpdateTags = 0
