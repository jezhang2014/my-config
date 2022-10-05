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

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'KabbAmine/zeavim.vim'
Plug 'preservim/nerdtree'
Plug 'nhooyr/neoman.vim'
Plug 'Yggdroot/LeaderF'

Plug 'grailbio/bazel-compilation-database'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-easy-align'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'fatih/vim-go'
"Plug "hardcoreplayers/dashboard-nvim'
Plug 'mhinz/vim-startify'
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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
"Plug 'bfrg/vim.jq'
Plug 'lambdalisue/suda.vim'
"dashboard需要依赖的功能
Plug 'liuchengxu/vim-clap'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }
Plug 'iberianpig/tig-explorer.vim'
Plug 'Chiel92/vim-autoformat'
"Plug 'google/vim-maktaba'
"Plug 'google/vim-codefmt'
"Plug 'google/vim-glaive'
"Plug 'kevinhwang91/rnvimr', { 'do': 'make sync' }
Plug 'jpalardy/vim-slime'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
"Plug 'hsanson/vim-android'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'neovim/nvim-lspconfig'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' "ranger depend
Plug 'kdheepak/lazygit.nvim'
Plug 'kevinhwang91/rnvimr'

"lua require'lspconfig'.bashls.setup{}

"Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
"Plug 'neovim/nvim-lspconfig'
"Plug 'simrat39/rust-tools.nvim'

"" Optional denpendencies
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

"" Debuging (needs plenary from above as well)
"Plug 'mfussenegger/nvim-dap'
"
let g:rust_use_custom_ctags_defs = 1
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/home/jezhang/tools/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
	\ 'n:modules',
	\ 's:structures:1',
	\ 'i:interfaces',
	\ 'c:implementations',
	\ 'f:functions:1',
	\ 'g:enumerations:1',
	\ 't:type aliases:1:0',
	\ 'v:constants:1:0',
	\ 'M:macros:1',
	\ 'm:fields:1:0',
	\ 'e:enum variants:1:0',
	\ 'p:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
	\ 'n': 'module',
	\ 's': 'struct',
	\ 'i': 'interface',
	\ 'c': 'implementation',
	\ 'f': 'function',
	\ 'g': 'enum',
	\ 't': 'typedef',
	\ 'v': 'variable',
	\ 'M': 'macro',
	\ 'm': 'field',
	\ 'e': 'enumerator',
	\ 'p': 'method',
  \ },
  \ }

Plug 'liuchengxu/vista.vim'

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

set clipboard+=unnamedplus

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"let g:gradle_path = "/usr/bin/gradle"
"let g:android_sdk_path = "/usr/lib/android-sdk/platform-tools"

let g:session_autosave = 'yes'
set ts=4 sw=4

let g:session_autoload = 'no'

" ranger viewer
"let g:rnvimr_draw_border = 1
"let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
"let g:rnvimr_enable_bw = 1
"let g:rnvimr_shadown_winblend = 70

"let g:airline_theme = "xtermlight'
let g:ariline_theme = 'soda'
"highlight Pmenu ctermbg=Yellow

"set foldmethod=syntax
"colorscheme pablo
"colorscheme murphy
"colorscheme potts

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <c-o> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:UltiSnipsExpandTrigger = '<c-j>'

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :<C-u>CocList -I symbols<CR>
nmap <silent><nowait> gl :<C-u>CocList outline<CR>
nmap <leader>rn <Plug>(coc-rename)

nnoremap tt :FloatermNew --height=0.8 --width=0.8 --autoclose=1<CR>
"nnoremap tf :FloatermNew --height=0.8 --width=0.9 --autoclose=1 fzf<CR>
"outer fzf use .bashrc FZF_DEFAULT_COMMAND config
command! FZF FloatermNew --height=0.8 --width=0.9 --autoclose=1 fzf
nnoremap tf :FZF<CR>
nnoremap tg :FloatermNew --height=0.9 --width=0.9 --autoclose=1 lazygit<CR>
nnoremap ti :FloatermNew --height=0.9 --width=0.9 --autoclose=1 tig<CR>
nnoremap td :FloatermNew --height=0.9 --width=0.9 --autoclose=1 lazydocker<CR>
nnoremap tn :FloatermNew --height=0.9 --width=0.9 --autoclose=1 lazynpm<CR>
nnoremap tl :CocList floaterm<CR>
"nnoremap tm :FloatermNew --height=0.9 --width=0.9 --autoclose=1 lf<CR>
nnoremap tm :RnvimrToggle<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>
"nnoremap <silent> tr :RnvimrToggle<CR>
" ctrl-j to move to next var of snippet
nnoremap <leader>sn :CocList snippets<CR>
nnoremap <leader>sm :CocList marks<CR>

" fzf plugin brings: FZF, Files, Rg, BLines, Lines, History, Ag, Buffers
nnoremap te :CocCommand explorer<CR>
nnoremap tb :Tagbar<CR>
" nnoremap tv :Vista!!<CR>
nnoremap tu :UndotreeToggle<CR>
" nnoremap <leader>bf :CocList buffers<CR>
nnoremap bf :CocList buffers<CR>
nnoremap <leader>nl :nohl<CR>
nnoremap <leader>st :Startify<CR>
nnoremap <leader>ss ::SSave<CR>
" nnoremap <leader>bl :BLines<CR>
nmap gf :BLines<CR>
" nnoremap <leader>li :Lines<CR>
nmap gn :Lines<CR>
nnoremap <leader>hi :History<CR>
"nnoremap <leader>bs :Buffers<CR>
nnoremap bs :Buffers<CR>
nnoremap <leader>mp :Maps<CR>


nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
map R :source $MYVIMRC<CR>
nmap <leader>g :echo expand("%:p")<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>mk :CocList marketplace<CR>
nmap <leader>bb <Plug>BookmarkToggle
nmap <leader>bs <Plug>BookmarkShowAll
nmap <Leader>ba <Plug>BookmarkAnnotate

" Rg could use c-t c-a c-v in new tab
" 不支持搜索符号链接目录
command! -bang -nargs=* Rga call fzf#vim#grep("rg --column --line-number --no-heading --color=always --glob \"!git/\" --glob \"!test/\" --glob \"!testdata/\" --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rgc call fzf#vim#grep("rg --column --line-number --no-heading --color=always --glob \"!git/\" --glob \"!test/\" --glob \"!testdata/\" --glob \"*.{cpp,c,cc,h}\" --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rgg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --glob \"!git/\" --glob \"!test/\" --glob \"!testdata/\" --glob \"*.{go}\" --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rgy call fzf#vim#grep("rg --column --line-number --no-heading --color=always --glob \"!git/\" --glob \"!test/\" --glob \"!testdata/\" --glob \"*.{yaml}\" --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rgr call fzf#vim#grep("rg --column --line-number --no-heading --color=always --glob \"!git/\" --glob \"!test/\" --glob \"!testdata/\" --glob \"*.{rs}\" --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rgb call fzf#vim#grep("rg --column --line-number --no-heading --color=always --glob \"!git/\" --glob \"!test/\" --glob \"!testdata/\" --glob \"BUILD\" --glob \"*.{bzl}\" --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)


command! -bang -nargs=* Rgec call fzf#vim#grep("rg --column --line-number --no-heading --color=always --glob \"!git/\" --glob \"!test/\" --glob \"!*test*\" --glob \"!generated_api_shadow/\" --glob \"!.ccls-cache\" --glob \"*.{cpp,c,cc,h}\" --smart-case -- ".shellescape(<q-args>), 1, fzf#viim#with_preview(), <bang>0)
command! -bang -nargs=* Rgeb call fzf#vim#grep("rg --column --line-number --no-heading --color=always --glob \"!git/\" --glob \"!test/\" --glob \"*.{cpp,c,cc,h}\" --smart-case -- ".shellescape(<q-args>)." $(bazel info execution_root)/../../", 1, fzf#vim#with_preview(), <bang>0)

highlight BookmarkSign ctermbg=NONE ctermfg=160
"highlight BookmarkLine ctermbg=194 ctermfg=NONE
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

"gaip=
"vipga=
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"whole file format
"noremap <leader>af :Autoformat<CR>
noremap <leader>ff :Autoformat<CR>

"google format
"autocmd filetype c,cpp,proto,javascript AutoFormatBuffer clang-format

function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

function! s:cocActionOpenFromSelected(type) abort
	execute 'CocCommand actions.open ' . a:type
endfunction

xmap <silent> <leader> a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader> a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>

let g:Lf_ReverseOrder = 1



"let g:Tlist_Ctags_Cmd='~/tools/ctags'
let g:Tlist_Ctags_Cmd='/home/jezhang/tools/bin/ctags'

set undofile
set undodir=~/.vim/undodir

let g:mkdx#settings = { 'highlight': { 'enable': 1 },
	\ 'enter': { 'shift': 1 },
	\ 'links': { 'external': { 'enable': 1} },
	\ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
	\ 'fold': { 'enable': 1} }
let g:polyglot_disabled = ['markdown']

" set mouse=a

function! s:isAtStartOfLine(mapping)
	let text_before_cursor = getline('.')[0 : col('.')-1]
	let mapping_pattern = '\V' . escape(a:mapping, '\')
	let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
	return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
	\ <SID>isAtStartOfLine('\|\|') ?
	\ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr>
	\ <SID>isAtStartOfLine('__') ?
	\ '<c-o>:silent! TableModeDisable<cr>' : '__'

" lf use markdown with lemonade
let g:mkdp_refresh_slow = 1
let g:mkdp_echo_preview_url = 1
" let g:mkdp_open_to_the_world = 1
" let g:mkdp_open_ip = '10.243.232.166'
" let g:mkdp_port = 8080

function! g:Open_browser(url)
	silent exe '!lemonade open 'a:url
endfunction
" let g:mkdp_browserfunc = 'g:Open_browser'

let g:markdown_compose_autostart = 0
au FileType markdown vmap <Leader>al :EasyAlign*<Bar><Enter>

let g:suda_smart_edit = 1

hi! CocErrorSign ctermfg=Black guifg=#000000
hi! CocInfoSign ctermfg=Black guifg=#000000
hi! CocWarningSign ctermfg=Black guifg=#000000

nnoremap <silent> <leader>gg :LazyGit<CR>

call plug#end()
