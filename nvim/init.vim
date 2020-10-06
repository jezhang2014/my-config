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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-easy-align'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'fatih/vim-go'
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'Yggdroot/indentLine'
Plug 'farmergreg/vim-lastplace'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'lfv89/vim-interestingwords'
Plug 'liuchengxu/graphviz.vim'
Plug 'vimwiki/vimwiki'
Plug 'SidOfc/mkdx'
Plug 'vim-vdebug/vdebug'
Plug 'dhruvasagar/vim-table-mode'
Plug 'rust-lang/rust.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'bfrg/vim-jq'
Plug 'lambdalisue/suda.vim'
"dashboard需要依赖的功能
Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }

function! BuildComposer(info)
	if a:info.status != 'unchanged' || a:info.force
		if has('nvim')
			!cargo build --release --locked
		else
			!cargo build --release --locked --no-default-features --features json-rpc
		endif
	endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

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

set clipboard=unnamedplus

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
"nnoremap tf :FloatermNew --width=0.8 fzf<CR>
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

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>N :nohl<CR>

nnoremap <leader>Fs :CocCommand clangd.switchSourceHeader<CR>

let g:Tlist_Ctags_Cmd='~/tools/ctags'

set undofile
set undodir=~/.vim/undodir

let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }
let g:polyglot_disabled = ['markdown']

set mouse=a

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" if use markdown with lemonade
let g:mkdp_refresh_slow = 1
let g:mkdp_echo_preview_url = 1
"let g:mkdp_open_to_the_world = 1
"let g:mkdp_open_ip = '10.243.232.166'
"let g:mkdp_port = 8080

function! g:Open_browser(url)
	silent exe '!lemonade open 'a:url
endfunction
"let g:mkdp_browserfunc = 'g:Open_browser'

function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --noheading --color=always --glob "!git/" --glob "!test/" --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

function! RipgrepFzfCpp(query, fullscreen)
	let command_fmt = 'rg --column --line-number --noheading --color=always --glob "!git/" --glob "!test/" --glob ".{cpp,c,cc,h}" --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RGC call RipgrepFzfCpp(<q-args>, <bang>0)

let g:markdown_composer_autostart = 0
au FileType markdown vmap <Leader>A :EasyAlign*<Bar><Enter>

function! RipgrepFzfEnvoy(query, fullscreen)
	let command_fmt = 'rg --column --line-number --noheading --color=always --glob "!git/" --glob "!test/" --glob "!.ccls-cache/" --glob ".{cpp,c,cc,h,proto}" --smart-case -- %s ~/source/envoy ~/source/proxy || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RGEnvoy call RipgrepFzfEnvoy(<q-args>, <bang>0)
nnoremap trs :RGEnvoy<CR>

function! RipgrepFzfEnvoyBuild(query, fullscreen)
	let command_fmt = 'rg --column --line-number --noheading --color=always --glob "!git/" --glob "!test/" --glob ".{cpp,c,cc,h}" --smart-case -- %s ~/.cache || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RGEnvoyBuild call RipgrepFzfEnvoyBuild(<q-args>, <bang>0)
nnoremap trb :RGEnvoyBuild<CR>

let g:suda_smart_edit = 1

call plug#end()

