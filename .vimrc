"------------------Basic setup------------------
set nocompatible                                    " always use the latest vimrc file
so ~/.vim/plugins.vim                               " source the plugins vim file
set mouse=a                                         " set mouse mode availiable
set t_Co=256                                        " use 256 colors in terminal vim
colorscheme xoria256                                " the theme i am using
" colorscheme  hybrid_material                      " alternative theme the theme i am using
set hidden                                          " let vim to set hideen buffers by default
" set textwidth=110                                 " The maxim text width
" set colorcolumn=+1                                " Then place a column to indicate that limit
set number                                          " display line numbers
set autoindent                                      " enables the auto indentation
set showmode                                        " always show what mode we're currently editing in
set wrap                                            " do wrap lines
set backspace=indent,eol,start                      " allow backspacing over everything in insert mode
set autoindent                                      " always set autoindenting on
" set copyindent                                    " copy the previous indentation on autoindenting
set visualbell                                      " don't beep
set noerrorbells                                    " don't beep
set autowrite                                       " Save on buffer switch
set completeopt=longest,menu,preview                " set the completion in the current file
set clipboard=unnamed                               " to copy and past
set timeout timeoutlen=200 ttimeoutlen=100

"------------------Leader key-------------------
let mapleader=','
let g:mapleader = ','
set listchars=tab:▸\ ,eol:¬                         " when hit set list! show invisibles


"------------------Autocommands------------------
command! -nargs=* Wrap set wrap linebreak nolist    " Wrap shortcut
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %              " automatically source the vimrc file
augroup end

" Jump to the last position when repoen a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"------------------Maps--------------------------
" here are some ways to fast edit files
" %% => path/to/current/directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%

"------------------Tab settings------------------
set tabstop=4                           " a tab is four spaces
set smarttab
set softtabstop=4                       " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                           " expand tabs by default (overloadable per file type later)
set shiftwidth=4                        " number of spaces to use for autoindenting
set shiftround                          " use multiple of shiftwidth when indenting with '<' and '>'

"---------------------Search---------------------
set hlsearch                            " hightlight the search
set incsearch
nmap <leader><space> :nohlsearch<cr>   " no hightlight search after this combination
set ignorecase                         " ignore case when searching
set smartcase                          " ignore case if search pattern is all lowercase,


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"---------------Split View Settings---------------
set splitbelow          " :sp open the new split below
set splitright          " :vsp open the new split right
map <C-h> <C-w>h        " quick switch to the left window
map <C-j> <C-w>j        " quick switch to the bottom window
map <C-k> <C-w>k        " quick switch to the top window
map <C-l> <C-w>l        " quick swtich to the right window

"---------------Tab settings-----------------------
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 :tablast<CR>

map <silent><leader>s :set spell!<cr>


syntax enable                   " enable syntax highlighting

" vim-javascript plugins
let g:javascript_plugin_jsdoc = 1

" vim-better-whitespace
highlight ExtraWhitespace ctermbg=yellow
autocmd BufWritePre * StripWhitespace

" NerdTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-k> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=0
let NERDTreeIgnore=['\~$', '\v(node_modules|public|target|dist|log|coverage|_build|priv)|(\.(swp|ico|git|svn|idea|nyc_output))$']

" set the tagbar toggle
nmap <C-\> :TagbarToggle<CR>

" ycm config (compatible with ultisnips)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 0
let g:SuperTabDefaultCompletionType = '<C-n>'

" Snippets config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" emmet config
let g:user_emmet_leader_key=','

" CtrlP config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|coverage|_build|priv)|(\.(swp|ico|git|svn))$'
nmap <C-e> :CtrlPBufTag<cr>
nmap <Leader>e :CtrlPMRUFiles<cr>

" greplace config
set grepprg=ack																" use ack for the search"
let g:grep_cmd_opts = '--noheading'

highlight LineNr ctermfg=grey

highlight Comment cterm=italic
highlight Type cterm=italic
highlight Constant cterm=bold

" emmet config
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

 "vim ale
let g:ale_linters = {
\   'javascript': ['eslint']
\}
let g:ale_sign_column_always = 1

set cursorline
autocmd FileType nerdtree setlocal nocursorcolumn
highlight Comment cterm=italic
highlight Type cterm=italic
highlight Constant cterm=bold

nnoremap <Leader>j :%!python -m json.tool<CR>

" Tips and notes
" - zz to center the screen of current line
" - gd highlight all of the existing defs in the file
" - %  create a new file
" - d  create a new directory
" - R  rename the current file/dir
" - D  delete the current file/dir
" - z= correct wrong spells
" - zg add current word to `good word` list
" - C] go to definition in the manual
" - Ct go back to the previous position
" - CD half page down
" - CU half page up
" - CB page up
" - CF page down
