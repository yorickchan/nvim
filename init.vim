if !exists('g:vscode')
  set encoding=utf-8
  set relativenumber
  set nu
  set cursorline
  set mouse=a
  set smarttab
  set cindent
  set tabstop=2
  set shiftwidth=2
  set showcmd
  set showmatch
  " always uses spaces instead of tab characters
  set expandtab
  set smartindent
  set termguicolors
  
  " from readme
  " if hidden is not set, TextEdit might fail.
  set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300
  
  " don't give |ins-completion-menu| messages.
  set shortmess+=c
  
  " always show signcolumns
  set signcolumn=yes
  
  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
  
  set incsearch
  set wrap
  set noswapfile
  set nobackup
  set undodir=~/.config/nvim/undodir
  set undofile
  
  set colorcolumn=80
  highlight ColorColumn ctermbg=0 guibg=lightgrey
  
  " Specify a directory for plugins
  call plug#begin('~/.vim/plugged')
  
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tweekmonster/gofmt.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
  Plug 'prettier/vim-prettier' ", { 'do': 'yarn install' }
  Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'
  Plug 'vuciv/vim-bujo'
  Plug 'tpope/vim-dispatch'
  Plug 'mbbill/undotree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  "Plug 'theprimeagen/vim-apm'
  Plug 'theprimeagen/vim-be-good', {'do': './install.sh'}
  Plug 'luochen1990/rainbow'
  Plug 'SirVer/ultisnips'
  " Snippets are separated from the engine. Add this if you want them:
  Plug 'honza/vim-snippets'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  
  " Nerd Tree
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  "Plug 'tsony-tsonev/nerdtree-git-plugin'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  
  " VIM theme and syntax highlight
  Plug 'colepeters/spacemacs-theme.vim'
  "Plug 'morhetz/gruvbox'
  Plug 'gruvbox-community/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  Plug 'phanviet/vim-monokai-pro'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'flazz/vim-colorschemes'
  Plug 'norcalli/nvim-colorizer.lua'
  
  
  " Initialize plugin system
  call plug#end()
  
  filetype plugin on
  
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  lua require'colorizer'.setup()
  if executable('rg')
    let g:rg_derive_root='ture'
  endif
  let g:airline_theme = 'molokai'
  let mapleader=" "
  
  let g:fzf_layout = {'window':{'width': 0.8, 'height': 0.8}}
  let $FZF_DEFAULT_OPTS='--reverse'
  
  inoremap jk <ESC>
  "nmap <C-n> :NERDTreeToggle<CR>
  nnoremap <leader><C-n> :NERDTreeToggle<CR>
  "vmap ++ <plug>NERDCommenterToggle
  "nmap ++ <plug>NERDCommenterToggle
  nmap <C-_>   <Plug>NERDCommenterToggle
  vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
  
  "
  " open NERDTree automatically
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * NERDTree
  
  let g:NERDTreeGitStatusConcealBrackets = 1
  let g:NERDTreeGitStatusWithFlags = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:NERDTreeGitStatusNodeColorization = 1
  let g:NERDTreeColorMapCustom = {
      \ "Modified"  : "#d9bf91",
      \ "Staged"    : "#0ee375",
      \ "Untracked" : "#FCE77C",
      \ "Renamed"   : "#51C9FC",
      \ "Unmerged"  : "#FC51E6",
      \ 'Deleted'   : "#EE1111",
      \ "Dirty"     : "#FFBD61",
      \ "Ignored"   : "#808080",
      \ "Clean"     : "#87939A",
      \ "Unknown"   : "#AA5511"
      \ }                         
  
  "let g:NERDTreeGitStatusIndicatorMapCustom = {
  "                \ 'Modified'  :'✹',
  "                \ 'Staged'    :'✚',
  "                \ 'Untracked' :'✭',
  "                \ 'Renamed'   :'➜',
  "                \ 'Unmerged'  :'═',
  "                \ 'Deleted'   :'✖',
  "                \ 'Dirty'     :'✗',
  "                \ 'Ignored'   :'☒',
  "                \ 'Clean'     :'✔︎',
  "                \ 'Unknown'   :'?',
  "                \ }
  
  let g:NERDTreeIgnore = ['^node_modules$']
  
  
  " sync open file with NERDTree
  " " Check if NERDTree is open or active
  function! IsNERDTreeOpen()        
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
  endfunction
  
  let g:mkdp_auto_start = 1
  
  " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
  " file, and we're not in vimdiff
  function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
      NERDTreeFind
      wincmd p
    endif
  endfunction
  
  " Highlight currently open buffer in NERDTree
  autocmd BufEnter * call SyncTree()
  
  " vim-prettier
  let g:prettier#quickfix_enabled = 0
  let g:prettier#quickfix_auto_focus = 0
  " prettier command for coc
  command! -nargs=0 Prettier :CocCommand prettier.formatFile
  " run prettier on save
  "let g:prettier#autoformat = 0
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
  
  
  " ctrlp
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  let g:ctrlp_user_caching = 0
  let g:netrw_browse_split = 2
  let g:netrw_banner = 0
  let g:netrw_winsize = 25
  
  let g:lsc_auto_map = v:true
  let g:flutter_hot_reload_on_save = 1
  
  " j/k will move virtual lines (lines that wrap)
  noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
  noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
  
  colorscheme gruvbox
  set background=dark
  
  let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
  
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"
  
  " coc config
  let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint', 
    \ 'coc-prettier', 
    \ 'coc-json', 
    \ 'coc-python', 
    \ ]
  
  let g:vim_markdown_folding_disabled = 1
  
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  
  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  
  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  
  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  
  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  
  " Remap for rename current word
  nmap <F2> <Plug>(coc-rename)
  
  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)
  
  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  
  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)
  
  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)
  
  " Create mappings for function text object, requires document symbols feature of languageserver.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)
  
  " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <C-d> <Plug>(coc-range-select)
  xmap <silent> <C-d> <Plug>(coc-range-select)
  
  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')
  
  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  
  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
  
  
  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
  
  
  " Some of these key choices were arbitrary;
  " it's just an example.
  nnoremap <leader>fa :FlutterRun<cr>
  nnoremap <leader>fq :FlutterQuit<cr>
  nnoremap <leader>fr :FlutterHotReload<cr>
  nnoremap <leader>fR :FlutterHotRestart<cr>
  nnoremap <leader>fD :FlutterVisualDebug<cr>
  
  nnoremap <leader>u :UndotreeShow<CR>
  nnoremap <leader><C-p> :GFiles<CR>
  nnoremap <leader>pf :Files<CR>
endif 
