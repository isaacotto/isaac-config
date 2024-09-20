--   __  ____  ____  __        _  _  __  _  _
--  /  \(_  _)(_  _)/  \  ___ / )( \(  )( \/ )
-- (  O ) )(    )( (  O )(___)\ \/ / )( / \/ \
--  \__/ (__)  (__) \__/       \__/ (__)\_)(_/

------- Basic Config ---------------------------------

-- Just a little substitution that makes for cleaner code.
local o = vim.opt

-- General
o.compatible = false          -- no vi compatibility
vim.g.mapleader = ','         -- leader key
o.syntax = 'on'               -- syntax highlighting
o.wildmode = 'longest,list'   -- wildcard search mode
o.mouse = 'a'                 -- mouse on
o.swapfile = false            -- no swapfiles
o.backupdir = '~/.cache/vim'  -- backup directory
o.updatetime = 250            -- decrease update time
o.timeoutlen = 300            -- decrease mapped sequence wait time
o.clipboard = 'unnamedplus'

-- Display
o.foldmethod = 'syntax'       -- Fold method.
o.cursorline = true           -- Highlight cursor line.
o.wrap = true                 -- Text wrap.
o.linebreak = true            -- Wraps long lines at 'breakat'.
o.breakindent = true          -- Same indent as last line.
o.showtabline = 2             -- Always show tab line.
o.splitbelow = true
o.splitright = true
o.number = true
o.relativenumber = true
o.scrolloff = 10              -- Minimum number of lines at top/bottom.
o.list = true                 -- Sets how whitespace characters display.
o.listchars = { tab = '<< ', trail = '·', nbsp = '⍽' }
o.signcolumn = 'yes'          -- keep signcolumn on by default

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Search
o.ignorecase = true           -- Ignore case when searching
o.smartcase = true            -- ...unless contains capital.
o.hlsearch = true             -- Highlights all matches.
o.incsearch = true            -- Shows pattern while searching.
o.inccommand = 'split'        -- Preview substitutions live, as you type.

-- Tabs/indenting
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.shiftwidth = 2

-- Behavior
o.whichwrap = '<,>,h,l'

-- Key bindings

-- Returns to dashboard
vim.keymap.set('n', '<leader>home', ':Alpha<CR>')

-- Sensible controls to resize splits (control + arrows).
vim.keymap.set('n', '<c-Up>', ':resize -1<CR')
vim.keymap.set('n', '<c-Down>', ':resize +1<CR')
vim.keymap.set('n', '<c-left>', ':vertical resize -1<CR')
vim.keymap.set('n', '<c-right>', ':vertical resize +1<CR')

-- Clear highlight of search, messages, floating windows.
vim.keymap.set({ "n", "i" }, "<Esc>", function()
  vim.cmd([[nohl]]) -- clear highlight of search
  vim.cmd([[stopinsert]]) -- clear messages (the line below statusline)
  for _, win in ipairs(vim.api.nvim_list_wins()) do -- clear all floating windows
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Clear highlight of search, messages, floating windows" })

-- Toggle nerdtree.
vim.keymap.set('n', '<F6>', ':NERDTreeToggle<CR>')

-- Use ctrl-[hjkl] to select the active split!
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Checkboxes.
vim.keymap.set('n', '<leader>box', '^ [ ]<esc>')
vim.keymap.set('n', '<leader>ch', '^f]hci[<C-k>OK<esc>')
vim.keymap.set('n', '<leader>part', '^f]hci[<C-k>0m<esc>')

-- Shortcut for spellchecking. Auto-corrects last mistake and jumps back to
-- prev. cursor position.
vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- Shortcut for 'select all'
vim.keymap.set('n', '<leader>a', 'ggVG')

-- Run command on cursor line.
vim.keymap.set('n', '<leader>run', '"zyy:@z<CR>')

-- Remap arrow keys to move up or down by DISPLAY lines (like gj/gk)
vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('x', '<Up>', 'gk')
vim.keymap.set('x', '<Down>', 'gj')
vim.keymap.set('i', '<Up>', '<C-O>gk')
vim.keymap.set('i', '<Down>', '<C-O>gj')

-- Hopefully disables middle mouse click (and double/triple/quad click).
vim.keymap.set({ 'n', 'x', 'i' }, '<MiddleMouse>', '<LeftMouse>')
vim.keymap.set({ 'n', 'x', 'i' }, '<2-MiddleMouse>', '<nop>')
vim.keymap.set({ 'n', 'x', 'i' }, '<3-MiddleMouse>', '<nop>')
vim.keymap.set({ 'n', 'x', 'i' }, '<4-MiddleMouse>', '<nop>')




-- Map jk and kj to escape using easyescape
vim.keymap.set('i', '<C-BS>', '<C-w>')
vim.keymap.set('i', '<C-h>', '<C-w>')

-- .pdf word count macro.
vim.keymap.set('n', '<leader>words', ':!<Space>ps2ascii<Space>%:r.pdf<Space><BAR><Space>wc<Space>-w<CR>')

-- Map jk and kj to escape using easyescape
vim.cmd([[
    let g:easyescape_chars = { "j": 1, "k": 1 }
    let g:easyescape_timeout = 100
    cnoremap jk <ESC>
    cnoremap kj <ESC>
     ]])

-- Open terminal in vsplit
vim.keymap.set("n", "<leader>term", ":vs term://zsh<CR>a", { desc = "Terminal in vsplit" })

-- Sensible way to return to normal mode in terminal.
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Windows settings
vim.cmd([[
    if has("win32")

      scriptencoding utf-8

      if exists("&smoothscroll")
        set smoothscroll

      endif
    endif
    ]])

-- Open markdown files using Firefox.
vim.cmd([[
    autocmd BufEnter *.md exe 'noremap <F5> :! /usr/lib/firefox/firefox %:p<CR><CR>'
     ]])

---- PLUGINS IN LUA ----------------------------------
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('stevearc/oil.nvim')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })

Plug('vim-voom/VOoM')
  -- let voom_ft_modes = {'markdown': 'pandoc', 'rmd': 'pandoc'}
  -- au BufRead,BufNewFIle *.Rmd command! Toc Voom

Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

Plug('tpope/vim-surround')

Plug('godlygeek/tabular')
Plug('preservim/vim-markdown')

Plug('nvim-tree/nvim-web-devicons')
Plug('echasnovski/mini.icons')

  -- Disables weird markdown folding
  vim.g.vim_markdown_folding_level = 0

-- Distraction-free mode.
Plug 'junegunn/goyo.vim'

  -- Alias to open Goyo because I can never remember that word.
  vim.cmd('command Mini Goyo')

Plug('tpope/vim-eunuch')

Plug('junegunn/vim-peekaboo')

Plug('lervag/vimtex')

-- Allows mapping jk/kj to escape without pausing.
Plug('zhou13/vim-easyescape')

-- LSP support.
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- Allows vimwiki.
Plug('vimwiki/vimwiki')

-- Allows use of <gcc> to auto-comment code.
Plug('tpope/vim-commentary')

-- Some more color schemes.
Plug('ellisonleao/gruvbox.nvim')
Plug('bluz71/vim-nightfly-colors')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug('rebelot/kanagawa.nvim')
Plug('NLKNguyen/papercolor-theme')
Plug('folke/tokyonight.nvim')

-- Alpha-related plugins
Plug('goolord/alpha-nvim', { ['lazy'] = true })
Plug('akinsho/bufferline.nvim', { ['dependencies'] = 'nvim-tree/nvim-web-devicons' })
Plug('nvim-lualine/lualine.nvim', { ['dependencies'] = 'nvim-tree/nvim-web-devicons' })
Plug('folke/which-key.nvim', { ['lazy'] = true })

vim.call('plug#end')

-- Telescope key bindings (must be called post-plug#end.
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set("n", "<leader>fa", ":Telescope find_files hidden=true search_dirs=~/<CR>")

---- END OF LUA --------------------------------------

-- If editing vimscript, use "set syntax=vim" to make things a little more pleasant.

vim.cmd([[

" Custom startify highlighting scheme:
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

" ---- Vimtex configuration --------------------------
  
" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:

if has("Linux")
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
endif

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
    autocmd FileType tex,latex inoremap <leader>b \textbf{}<Esc>i 
    autocmd FileType tex,latex inoremap <leader>i \textit{}<Esc>i
    autocmd FileType tex,latex inoremap <leader>sc \textsc{}<Esc>i
    autocmd FileType tex,latex inoremap <leader>tt \texttt{}<Esc>i
    autocmd FileType tex,latex inoremap <leader>m $$<Esc>i
    autocmd FileType tex,latex inoremap <leader>e \emph{}<Esc>i

    nnoremap <leader>boiler :r ~/.config/nvim/templates/boilerplate.tex<CR>kdd22j

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

" ---- HTML settings ---------------------------------
    
" This sets the foldmethod to "marker" for html documents.
" Use {{{sometag or <-- {{{sometag -->
" Ideally there would be a way to do this ONLY when the 
" file is opened in neomutt. Maybe you can pass commands when
" opening the editor?
    "autocmd FileType html set foldmethod=marker

" This issues a command which pastes my email template into a document, first
" setting fold method to "marker". You could just use :r to read the file but
" .-1read pastes -1 lines up.
if has("Linux")
    nnoremap ,email :set foldmethod=marker<CR>G:.-1read ~/.mutt/templates/emailtemplate.html<CR>jji
endif

" ---- Vimwiki settings ------------------------------

" Creates default settings which hold across all wikis.
let wiki_default = {}
let wiki_default.auto_export = 0
let wiki_default.auto_toc = 0
let wiki_default.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh'}
let wiki_default.syntax = 'markdown'
let wiki_default.ext = '.md'

" Default wiki
let home_wiki = copy(wiki_default)
let home_wiki.path = '~/vimwiki/'
let home_wiki.diary_rel_path = 'diary/'
let home_wiki.path_html = '~/html/vimwiki/'

" Work wiki
let work_wiki = copy(wiki_default)
let work_wiki.path = '~/isaac-otto-usc-docs/'
let work_wiki.diary_rel_path = 'logbook/'

let g:vimwiki_list = [home_wiki, work_wiki]

" This will make sure vimwiki will only set the filetype of markdown files inside a wiki directory, rather than globally.
let g:vimwiki_global_ext = 0 
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Automatically update links on read diary
    command! Diary VimwikiDiaryIndex
    augroup vimwikigroup
        autocmd!
        autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
    augroup end

" sets vimwiki folding behavior (can be '' to disable
" 'expr' 'syntax' or 'list')
    let g:vimwiki_folding=''

" Should auto-update vimwiki diary index whenever it's reloaded
" let g:vimwiki_list = [{'auto_diary_index': 1}]
    autocmd BufEnter diary.md :VimwikiDiaryGenerateLinks

" ---- Settings that like to be called late ----------

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
    "colorscheme default

" SETS BRACE MATCHING COLORS -- should be called after color scheme
    hi MatchParen cterm=none ctermbg=green ctermfg=blue

" SETS CURSOR LINE TO HIGHLIGHT INSTEAD
    set cursorline
    hi CursorLine term=bold cterm=bold guibg=Grey40

" allows transparent background for vim
" must go underneath color scheme!
    hi Normal guibg=NONE ctermbg=NONE

" Default setup for oil.nvim from https://github.com/stevearc/oil.nvim
" Oilconfig is stored at ./lua/oilconfig.lua

if has ("Linux")
  lua require('oilconfig')
  lua require('alpha-config')
endif

]])

-- With lua you can run arbitrary functions triggered by key mappings:
-- vim.keymap.set("n", "<leader>$", function()
--     print("hello isaac")
-- end)
