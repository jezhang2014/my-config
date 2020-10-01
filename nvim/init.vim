call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'
Plug 'jhbabon/scout'
Plug 'majutsushi/tagbar'
Plug 'brooth/far.vim'
Plug 'mbbill/undotree'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'preservim/nerdtree'
Plug 'nhooyr/neoman.vim'
Plug 'Yggdroot/LeaderF'
Plug 'edkolev/tmuxline.vim'
Plug 'grailbio/bazel-compilation-database'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-easy-align'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'fatih/vim-go'


"set relativenumber
set number
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
set incsearch
set ignorecase
set smartcase

let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-marketplace']

set hidden
set updatetime=100

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme = 'xtermlight'
"highlight Pmenu ctermbg=Yellow

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:UltiSnipsExpandTrigger = '<c-j>'

inoremap <silent><expr> <c-o> coc#refresh()

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

function! s:cocActionsOpenFromSelected(type) abort
	execute 'CocCommand actions.open ' . a:type
endfunction

xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'Sam Zhang'

nnoremap te :CocCommand explorer<CR>
"nnoremap te :NERDTreeToggle<CR>
nnoremap tt :CocCommand floaterm.new<CR>
nnoremap tf :FloatermNew --width=0.8 fzf<CR>
nnoremap tg :FloatermNew --height=0.8 --width=0.8 lazygit<CR>
nnoremap tp :FloatermNew --height=0.8 --width=0.8 ipython<CR>
nnoremap tl :FloatermNew lf<CR>
nnoremap tu :UndotreeToggle<CR>
nnoremap tb :Tagbar<CR>

"nnoremap <silent> <leader> :WhichKey 'LEADER'<CR>
map R :source $MYVIMRC<CR>

nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset

nnoremap <silent> <Leader>rg :Leaderf rg<CR>
let g:Lf_ReverseOrder = 1

nmap <leader>g :echo expand("%:p")<CR>

nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w,  :vertical resize -3<CR>
nmap    w.  :vertical resize +3<CR>

nmap t% :tabedit %<CR>
nmap td :tabclose<CR>
nmap <leader>n :tabnext<CR>

nnoremap <silent><nowait> <leader>o :<C-u>CocList outline<CR>
nnoremap <silent><nowait> <leader>s :<C-u>CocList -I symbols<CR>

nnoremap <leader>Bb :CocCommand bookmark.toggle<CR>
nnoremap <leader>Ba :CocCommand bookmark.annotate<CR>
nnoremap <leader>Bl :CocList bookmark<CR>
nnoremap <leader>Bf :CocList buffers<CR>

nnoremap <leader>Ff :CocList fs<CR>
nnoremap <leader>Fze :FZF ~/source/envoy<CR>
nnoremap <leader>Fzp :FZF ~/source/proxy<CR>
nnoremap <leader>Fzi :FZF ~/source/istio<CR>

nnoremap <leader>N :nohl<CR>


call plug#end()

