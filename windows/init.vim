
"  ██████  ████████ ████████  ██████        ██    ██ ██ ███    ███ 
" ██    ██    ██       ██    ██    ██       ██    ██ ██ ████  ████ 
" ██    ██    ██       ██    ██    ██ █████ ██    ██ ██ ██ ████ ██ 
" ██    ██    ██       ██    ██    ██        ██  ██  ██ ██  ██  ██ 
"  ██████     ██       ██     ██████          ████   ██ ██      ██

"    █     █░ ██▓ ███▄    █ ▓█████▄  ▒█████   █     █░  ██████    
"   ▓█░ █ ░█░▓██▒ ██ ▀█   █ ▒██▀ ██▌▒██▒  ██▒▓█░ █ ░█░▒██    ▒    
"   ▒█░ █ ░█ ▒██▒▓██  ▀█ ██▒░██   █▌▒██░  ██▒▒█░ █ ░█ ░ ▓██▄      
"   ░█░ █ ░█ ░██░▓██▒  ▐▌██▒░▓█▄   ▌▒██   ██░░█░ █ ░█   ▒   ██▒   
"   ░░██▒██▓ ░██░▒██░   ▓██░░▒████▓ ░ ████▓▒░░░██▒██▓ ▒██████▒▒   
"   ░ ▓░▒ ▒  ░▓  ░ ▒░   ▒ ▒  ▒▒▓  ▒ ░ ▒░▒░▒░ ░ ▓░▒ ▒  ▒ ▒▓▒ ▒ ░   
"     ▒ ░ ░   ▒ ░░ ░░   ░ ▒░ ░ ▒  ▒   ░ ▒ ▒░   ▒ ░ ░  ░ ░▒  ░ ░   
"     ░   ░   ▒ ░   ░   ░ ░  ░ ░  ░ ░ ░ ░ ▒    ░   ░  ░  ░  ░     
"       ░     ░           ░    ░        ░ ░      ░          ░     
"                            ░                                   

"""""""""""""""""""""""""""""""
"""BASIC CONFIGURATIONS""""""""
"""""""""""""""""""""""""""""""

"set termguicolors
"highlight Normal ctermbg=none guibg=none
"highlight NonText ctermbg=none guibg=none
"highlight Comment cterm=italic ctermfg=8

"set noswf
set nocompatible            " disable compatibility to old-time vi
"set showmatch              " show matching 
set ignorecase              " case insensitive 
"set mouse=v                " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
"set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                   " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

set wrap                    " enable soft wrapping at the edge of the screen

" make text not wrap in the middle of a "word"
set linebreak

" hard wrap at 80 characters
" set textwidth=80

" allows < > h l to move to next/previous line
set whichwrap+=<,>,h,l

"indents wrapped lines to level of current tab
set breakindent
" set breakindentopt=shift:2

" Speed up text rendering which is necessary for some reason??
set ttyfast
set lazyredraw

" set system clipboard to be default copy/paste register
set clipboard+=unnamedplus

 " always show tabs bar at top of screen
set showtabline=2

" sets default new split location to either below current buffer or to right
set splitbelow splitright

"""""""""""""""""
"""KEY BINDINGS""
"""""""""""""""""

" Remap colon to semicolon to avoid "shift" when
" entering commands. Then double press semicolon
" to get semicolon.
"map ; :
"noremap ;; ;

" ESC clears search field as well.
map <esc> :noh <CR>

" Map NERDTreeToggle to F6
nmap <F6> :NERDTreeToggle<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Remaps arrow keys to move up or down by DISPLAY lines (like gj/gk)
nnoremap <Up>   gk
nnoremap <Down> gj
xnoremap <Up>   gk
xnoremap <Down> gj
inoremap <Up>   <C-O>gk
inoremap <Down> <C-O>gj

" Hopefully disables middle mouse click (and double/triple/quad click)
nnoremap <MiddleMouse> <LeftMouse>
xnoremap <MiddleMouse> <LeftMouse>
inoremap <MiddleMouse> <LeftMouse>
nnoremap <2-MiddleMouse> <nop>
xnoremap <2-MiddleMouse> <nop>
inoremap <2-MiddleMouse> <nop>
nnoremap <3-MiddleMouse> <nop>
xnoremap <3-MiddleMouse> <nop>
inoremap <3-MiddleMouse> <nop>
nnoremap <4-MiddleMouse> <nop>
xnoremap <4-MiddleMouse> <nop>
inoremap <4-MiddleMouse> <nop>

"map jk and kj to escape using easyescape
   let g:easyescape_chars = { "j": 1, "k": 1 }
   let g:easyescape_timeout = 2000
   cnoremap jk <ESC>
   cnoremap kj <ESC>
   
" Ctrl + BS in insert mode deletes entire word
	noremap! <C-BS> <C-w>
	noremap! <C-h> <C-w>

"""""""""""""""
"""PLUGINS"""""
"""""""""""""""

call plug#begin()
    
    " USE OF PLUGINS VIA VIMPLUG
    "
    " The default plugin directory will be as follows:
    "   - Vim (Linux/macOS): '~/.vim/plugged'
    "   - Vim (Windows): '~/vimfiles/plugged'
    "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
    " You can specify a custom plugin directory by passing it as the argument
    "   - e.g. `call plug#begin('~/.vim/plugged')`
    "   - Avoid using standard Vim directory names like 'plugin'

""""""""""""""""""""""""""""""""
""""""""""""MY PLUGINS""""""""""
""""""""""""""""""""""""""""""""
" Nerdtree file browser
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Vimtex (for compiling latex inside vim)
Plug 'lervag/vimtex'

" allows mapping jk and kj to escape without pausing?
Plug 'zhou13/vim-easyescape'

" Get Utilisnips
" Plug 'sirver/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

    let g:UltiSnipsSnippetDirectories=[$HOME.'/home/io/.local/share/nvim/plugged/vim-snippets/UltiSnips']
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vimwiki
Plug 'vimwiki/vimwiki'

" Startify (start-up screen)
Plug 'mhinz/vim-startify'

"	let g:startify_lists = [
"	  \ { 'type': 'files',     'header': ['   MRU']            },
"	  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
"	  \ { 'type': 'sessions',  'header': ['   Sessions']       },
"	  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
"	  \ { 'type': 'commands',  'header': ['   Commands']       },
"	  \ ]

	let g:startify_lists = []
	  
	let g:startify_padding_left = 30
	    let g:startify_custom_header = [
	\ '      ╔═════════════════════════════════════════════════════════════════════╗ ',
	\ '      ║                                                                     ║ ',
	\ '      ║   ██████  ████████ ████████  ██████        ██    ██ ██ ███    ███   ║ ',
	\ '      ║  ██    ██    ██       ██    ██    ██       ██    ██ ██ ████  ████   ║ ',
	\ '      ║  ██    ██    ██       ██    ██    ██ █████ ██    ██ ██ ██ ████ ██   ║ ',
	\ '      ║  ██    ██    ██       ██    ██    ██        ██  ██  ██ ██  ██  ██   ║ ',
	\ '      ║   ██████     ██       ██     ██████          ████   ██ ██      ██   ║ ',
	\ '      ║                                         (for Windows™)              ║ ',
	\ '      ╚═════════════════════════════════════════════════════════════════════╝ ',
	\]
	
	let g:startify_bookmarks = []
	let g:startify_commands = []
	let g:startify_files_number = 5
	let g:startify_session_before_save = []

" SOME MORE COLOR SCHEMES
Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'bluz71/vim-nightfly-colors'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'rebelot/kanagawa.nvim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" For some reason this REALLY wants to go here.
" Now, no matter what color scheme is used, it will
" make the header color #131 (indian red)
augroup custom_highlight
  autocmd!
  au ColorScheme * highlight StartifyHeader ctermfg=131
  au ColorScheme * highlight StartifyBracket ctermfg=131
  au ColorScheme * highlight StartifyNumber ctermfg=145
  au ColorScheme * highlight StartifySpecial ctermfg=145
augroup END

"""""""""""""""
"""END PLUGINS"
"""""""""""""""


"""""""""""""""
"""VIMTEX.CONF" (Settings for VimTex plugin)
"""""""""""""""
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
" (on Windows I had to set this to 'general')
 let g:vimtex_view_method = 'general'

" Or with a generic interface:
" (make sure SumatraPDF is added to the PATH on Windows)
 let g:vimtex_view_general_viewer = 'SumatraPDF'
 
" I set this to the default on Windows 
 let g:vimtex_view_general_options = '@pdf'


" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
" (this works but I'm gonna try something else)
  let g:vimtex_compiler_method = 'latexmk'
  let mapleader = ","
  
  let g:vimtex_compiler_engine = 'lualatex'
  
 noremap <leader>ll :VimtexCompile<cr>

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" Other LaTeX keybindings:
autocmd FileType tex,latex inoremap ,b \textbf{}<Esc>i 
autocmd FileType tex,latex inoremap ,i \textit{}<Esc>i
autocmd FileType tex,latex inoremap ,sc \textsc{}<Esc>i
autocmd FileType tex,latex inoremap ,tt \texttt{}<Esc>i
autocmd FileType tex,latex inoremap ,m $$<Esc>i
autocmd FileType tex,latex inoremap ,e \emph{}<Esc>i

autocmd FileType tex,latex inoremap ,bp \documentclass{article}<CR><CR>\usepackage[margin=1in]{geometry}<CR><CR>\title{Title}<CR>\author{Isaac Otto}<CR>\date{\today}<CR><CR>\begin{document}<CR>\maketitle<CR><CR><CR><CR>\end{document}<Esc>2ki


" turn off the dumb vimtex concealing function!!
let g:vimtex_syntax_conceal_disable = 1

""""""""""""""
"""END VIMTEX"
""""""""""""""


""""""""""""""""""""""""""""""""""""""""
""SETTINGS THAT LIKE TO BE CALLED LATE""
""""""""""""""""""""""""""""""""""""""""

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" COLOR SCHEME STUFF SEEMS TO ENJOY BEING AT THE END
set background=dark
"colorscheme habamax
colorscheme PaperColor

" SETS BRACE MATCHING COLORS -- should be called after color scheme
hi MatchParen cterm=none ctermbg=green ctermfg=blue

" SETS CURSOR LINE TO HIGHLIGHT INSTEAD
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" allows transparent background for vim
" must go underneath color scheme!
hi Normal guibg=NONE ctermbg=NONE


