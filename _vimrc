" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"================pathogen=================
execute pathogen#infect()

"colorscheme desert
"colorscheme darkburn
"set t_Co=256
syntax on
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
if has('gui_running')
	set background=light
else
	set background=light
endif

colorscheme solarized

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
set nobackup


"================ ctrlp ===================
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|o)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

"================YouCompleteMe============
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
nnoremap <F7> :YcmCompleter GoToDefinition<CR>

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

"=================== airline =======================
set ls=2

"==========NerdTree setting =======
map nt :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

