set guicursor=n-v-c-i:block
set guicursor+=a:blinkon0
set number
set relativenumber
syntax on
set tabstop=4
set nocompatible
set scrolloff=5
set nowrap
set showcmd
set hlsearch
set history=300
set ignorecase
set showmatch
set wildmode=longest,list
filetype plugin indent on
set mouse=a
set clipboard=unnamedplus
set cursorline
set noswapfile
set t_Co=256
set encoding=UTF-8
set guifont=Hack\ 12
set ma

if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

let NERDTreeShowHidden=1
map <silent> <C-_> :NERDTreeToggle<CR>

"colorscheme catppuccin_mocha 
colorscheme codedark
let g:lightline = {'colorscheme': 'deus'}
set noshowmode
set laststatus=2
if exists("b:current_syntax")
	  finish
	endif
	
	" case is significant
	" syn case ignore
	" ProMeLa Keywords
	syn keyword promelaStatement	proctype if else while chan do od fi break goto unless
	syn keyword promelaStatement	active assert label atomic
	syn keyword promelaFunctions	skip timeout run
	syn keyword promelaTodo         contained TODO
	" ProMeLa Types
	syn keyword promelaType			bit bool byte short int
	" Operators and special characters
	syn match promelaOperator	"!"
	syn match promelaOperator	"?"
	syn match promelaOperator	"->"
	syn match promelaOperator	"="
	syn match promelaOperator	"+"
	syn match promelaOperator	"*"
	syn match promelaOperator	"/"
	syn match promelaOperator	"-"
	syn match promelaOperator	"<"
	syn match promelaOperator	">"
	syn match promelaOperator	"<="
	syn match promelaOperator	">="
	syn match promelaSpecial	"\["
	syn match promelaSpecial	"\]"
	syn match promelaSpecial	";"
	syn match promelaSpecial	"::"
	" ProMeLa Comments
	syn region promelaComment start="/\*" end="\*/" contains=promelaTodo,@Spell
	syn match  promelaComment "//.*" contains=promelaTodo,@Spell
	
	" Class Linking
	hi def link promelaStatement    Statement
	hi def link promelaType	        Type
	hi def link promelaComment      Comment
	hi def link promelaOperator	    Type
	hi def link promelaSpecial      Special
	hi def link promelaFunctions    Special
	hi def link promelaString		String
	hi def link promelaTodo	        Todo
	
	let b:current_syntax = "promela"


" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 8ab33f13469654031b0901f165bc4dd4 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/robert/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
