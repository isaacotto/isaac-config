
"  ██████  ████████ ████████  ██████        ██    ██ ██ ███    ███ 
" ██    ██    ██       ██    ██    ██       ██    ██ ██ ████  ████ 
" ██    ██    ██       ██    ██    ██ █████ ██    ██ ██ ██ ████ ██ 
" ██    ██    ██       ██    ██    ██        ██  ██  ██ ██  ██  ██ 
"  ██████     ██       ██     ██████          ████   ██ ██      ██
"                         _   _                        
"                        | | (_)                       
"                        | |  _   _ __    _   _  __  __
"                        | | | | | '_ \  | | | | \ \/ /
"                        | | | | | | | | | |_| |  >  < 
"                        |_| |_| |_| |_|  \__,_| /_/\_\
                                       
"""""""""""""""""""""""""""""""
"""BASIC CONFIGURATIONS""""""""
"""""""""""""""""""""""""""""""

"should allow saving with root privileges using :W
"you will probably have to edit sudo.conf to point it 
"to the ssh-askpass utility
    com -bar W exe 'w !sudo tee >/dev/null %:p:S' | set1 nomod

    set nocompatible            " disable compatibility to old-time vi
    set foldmethod=syntax
    "set showmatch              " show matching 
    set ignorecase              " case insensitive 
    set hlsearch                " highlight search 
    set incsearch               " incremental search
    set tabstop=4               " number of columns occupied by a tab 
    set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
    set expandtab               " converts tabs to white space
    set shiftwidth=4            " width for autoindents
    "set autoindent              " indent a new line the same amount as the line just typed
    set number                  " add line numbers
    set relativenumber          " line numbers relative to cursor
                                " (having both on at once allows hybrid)
    set wildmode=longest,list   " get bash-like tab completions
    filetype plugin indent on   " allow auto-indenting depending on file type
    syntax on                   " syntax highlighting
    set mouse=a                 " enable mouse click
    set cursorline              " highlight current cursorline
    set ttyfast                 " Speed up scrolling in Vim
    set spell                   " enable spell check (may need to download language package)
    " set noswapfile            " disable creating swap file
    " set backupdir=~/.cache/vim " Directory to store backup files.

" sets column at 80 characters in gray
    highlight ColorColumn ctermbg=gray
    set colorcolumn=80

" enable soft wrapping at the edge of the screen
    set wrap

" make text not wrap in the middle of a "word"
    set linebreak

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
" <silent> so that it doesn't display message.
" I think the <C-U> removes any selected range
" to avoid error 481.
    map <silent> <esc> :<C-U>noh<CR>

" Map NERDTreeToggle to F6
    nmap <F6> :NERDTreeToggle<CR>

" Use ctrl-[hjkl] to select the active split!
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>

" Quotation marks
    inoremap ,germanleft „
    inoremap ,germanright “
    inoremap ,frenchleft « 
    inoremap ,frenchright  »
    
" Tick boxes or check marks, etc.
    inoremap ,box [ ]<esc>i
    inoremap ,ch <esc>ci[<C-k>OK<esc>
    inoremap ,part <esc>ci[<C-k>0m<esc>
    inoremap ,fail <esc>ci[<C-k>*X<esc>

" shortcut for "select all"
    nnoremap ,a ggVG

" run command on cursor line
    nnoremap ,run "zyy:@z<CR>

    " In normal mode, <,box> will send the box to the end of the line.
    " nnoremap ,box $a<Space>[ ]<esc>i
    " nnoremap ,ch i<esc>ci[<C-k>OK<esc>
    " nnoremap ,part i<esc>ci[<C-k>0m<esc>
    " nnoremap ,fail i<esc>ci[<C-k>*X<esc>

    " In normal mode <,box> should place the box after the - or * but before
    " the text.
    nnoremap ,box ^a [ ]<esc> 
    nnoremap ,ch ^f]hci[<C-k>OK<esc>
    nnoremap ,part ^f]hci[<C-k>0m<esc>

" Flat, sharp and natural accidentals.
    inoremap ,flat <C-K>Mb
    inoremap ,sharp <C-k>MX
    inoremap ,natural <C-k>Mx

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
    let g:easyescape_timeout = 100
    cnoremap jk <ESC>
    cnoremap kj <ESC>

" Ctrl + BS in insert mode deletes entire word
    noremap! <C-BS> <C-w>
    noremap! <C-h> <C-w>

" pdf word count macro
    nnoremap ,pdfcount :!<Space>ps2ascii<Space>%:r.pdf<Space><BAR><Space>wc<Space>-w<CR>

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
    Plug 'sirver/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'

    let g:UltiSnipsSnippetDirectories=[$HOME.'/home/io/.local/share/nvim/plugged/vim-snippets/UltiSnips']
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Use release branch 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Allows vimwiki
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
"
    let g:startify_bookmarks= [
                \ {'1': '~/.config/nvim/init.vim'},
                \ {'2': '~/.config/kitty/kitty.conf'},
                \ ]

	let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks',},
            \ ]


	let g:startify_padding_left = 25
	    let g:startify_custom_header = [
	\ '     ╔═════════════════════════════════════════════════════════════════════╗ ',
	\ '     ║                                                                     ║ ',
	\ '     ║   ██████  ████████ ████████  ██████        ██    ██ ██ ███    ███   ║ ',
	\ '     ║  ██    ██    ██       ██    ██    ██       ██    ██ ██ ████  ████   ║ ',
	\ '     ║  ██    ██    ██       ██    ██    ██ █████ ██    ██ ██ ██ ████ ██   ║ ',
	\ '     ║  ██    ██    ██       ██    ██    ██        ██  ██  ██ ██  ██  ██   ║ ',
	\ '     ║   ██████     ██       ██     ██████          ████   ██ ██      ██   ║ ',
	\ '     ║                                         (for Linux™)                ║ ',
	\ '     ╚═════════════════════════════════════════════════════════════════════╝ ',
	\]
	
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

" Allows use of <gcc> to auto-comment code
    Plug 'tpope/vim-commentary'

call plug#end()
"""""""""""""""
"""END PLUGINS"
"""""""""""""""
" For some reason this REALLY wants to go here.
" Now, no matter what color scheme is used, it will
" make the header color #131 (indian red)
    augroup custom_highlight
      autocmd!
      au ColorScheme * highlight StartifyHeader ctermfg=131
      au ColorScheme * highlight StartifyBracket ctermfg=131
      au ColorScheme * highlight StartifyNumber ctermfg=145
      au ColorScheme * highlight StartifySpecial ctermfg=145
      au ColorScheme * highlight StartifyFooter ctermfg=131 ctermbg=145
    augroup END

"""""""""""""""
"""VIMTEX.CONF" (Settings for VimTex plugin)
"""""""""""""""
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
    let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Should disable dumb highlighting on zathura on startup.
    let g:vimtex_view_forward_search_on_start = 0

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

" Sets char limit to 80 only for wiki files.
    autocmd bufreadpre *.wiki setlocal textwidth=80

" turn off the dumb vimtex concealing function!!
    let g:vimtex_syntax_conceal_disable = 1

" To change the size of the error window when compiling,
" find /ftplugin/qf.vim file somewhere in the plugins folder
" then add the following, where the "5" refers to the height
" in lines of the window. I just dropped it at the end of the
" file:
    " augroup quickfix_autocmds
    "  autocmd!
    "  autocmd BufReadPost quickfix 5wincmd _
    " augroup END

" END VIMTEX

" HTML SETTINGS
    
" This sets the foldmethod to "marker" for html documents.
" Use {{{sometag or <-- {{{sometag -->
" Ideally there would be a way to do this ONLY when the 
" file is opened in neomutt. Maybe you can pass commands when
" opening the editor?
    "autocmd FileType html set foldmethod=marker

" This issues a command which pastes my email template into a document, first
" setting fold method to "marker". You could just use :r to read the file but
" .-1read pastes -1 lines up.
    nnoremap ,email :set foldmethod=marker<CR>G:.-1read ~/.mutt/templates/emailtemplate.html<CR>jji

""""""""""""""""""""""""""""""""""""""""
""VIMWIKI SETTINGS""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
    command! Diary VimwikiDiaryIndex
    augroup vimwikigroup
        autocmd!
        " automatically update links on read diary
        autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
    augroup end

" sets vimwiki folding behavior (can be '' to disable
" 'expr' 'syntax' or 'list')
    let g:vimwiki_folding=''

" sets fold level for entirety of vim
" this should leave the topmost level 
" open but anything underneath is folded by default.
    " set foldlevel=1

" Should auto-update vimwiki diary index whenever it's reloaded
" let g:vimwiki_list = [{'auto_diary_index': 1}]
    autocmd BufEnter diary.md :VimwikiDiaryGenerateLinks

""END VIMWIKI"""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
""SETTINGS THAT LIKE TO BE CALLED LATE""
""""""""""""""""""""""""""""""""""""""""

" Sets color scheme based on file type, then returns to a default
" when exiting a buffer of that file type.
    autocmd BufNewFile,BufRead *.wiki let g:tmpcolor=g:colors_name            
    autocmd BufEnter *.wiki colorscheme kanagawa-wave | set ft=habamax                  
    autocmd BufLeave *.wiki exe 'colorscheme '.g:tmpcolor                     

" Start NERDTree and put the cursor back in the other window.
    " autocmd VimEnter * NERDTree | wincmd p

" COLOR SCHEME STUFF SEEMS TO ENJOY BEING AT THE END
    set background=dark
    colorscheme PaperColor
    "colorscheme kanagawa-dragon
    "colorscheme default

" SETS BRACE MATCHING COLORS -- should be called after color scheme
    hi MatchParen cterm=none ctermbg=green ctermfg=blue

" SETS CURSOR LINE TO HIGHLIGHT INSTEAD
    set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey40

" allows transparent background for vim
" must go underneath color scheme!
    hi Normal guibg=NONE ctermbg=NONE

""""""""END LATE SETTINGS""""""""""""""""""

