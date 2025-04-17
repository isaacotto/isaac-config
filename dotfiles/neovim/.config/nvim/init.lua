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
-- o.syntax = 'on'               -- syntax highlighting (off so only treesitter is used)
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
o.showtabline = 1             -- Always show tab line.
o.splitbelow = true           -- Always split below.
o.splitright = true           -- Always split right.
o.number = true               -- Show line numbers.
o.relativenumber = true       -- Relative line numbers.
o.scrolloff = 10              -- Minimum number of lines at top/bottom.
-- o.list = true                 -- Sets how whitespace characters display.
-- o.listchars = { tab = '<< ', trail = '·', nbsp = '⍽' }
-- o.listchars = { trail = '·', nbsp = '⍽' }
o.signcolumn = 'yes'          -- keep signcolumn on by default
o.fillchars = {eob = " "}     -- end-of-buffer character

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set filetype to markdown for .md files
-- I had to get rid of 'preservim/vim-markdown' to fix ugly folding and
-- institute this caveman method instead.
-- I'm not sure why I have to tell nvim that the file type is markdown
-- when Lualine understands it already, but I do.
-- Also, setting foldlevel=1 means that the first level of folds (i.e.
-- the broadest header) will remain unfolded.
vim.cmd([[ 
autocmd BufNewFile,BufRead *.md set filetype=markdown 
autocmd BufNewFile,BufRead *.md let g:markdown_folding=1
autocmd BufNewFile,BufRead *.md set foldlevel=1
]])

-- Search
o.ignorecase = true           -- Ignore case when searching
o.smartcase = true            -- ...unless contains capital.
o.hlsearch = true             -- Highlights all matches.
o.incsearch = true            -- Shows pattern while searching.
o.inccommand = 'split'        -- Preview substitutions live, as you type.

-- Tabs/indenting
o.tabstop = 8                 -- Default setting 8
o.softtabstop = 4             -- Number of spaces that <Tab> counts for.
o.expandtab = true            -- Turn tabs into spaces.
o.shiftwidth = 4              -- Auto-indents by 4 spaces; also shift + > is 4 spaces.

-- Behavior
o.whichwrap = '<,>,h,l'       -- Allows movement to next line from last char.

-- Key bindings

-- MARC normalizer
-- This takes a human-readable marc record and copies it into the main buffer in such a way that it can be pasted into Connexion.
-- I should probably also do one to turn it into MARCedit readable code...
vim.cmd([[
nnoremap <silent> <leader>oclc <Esc><Esc>yi{/}<CR>o{<CR>}<Esc>kpvi{:s/ //<CR>vi{:s/ //<CR>vi{:s/\\/ /g<CR>vi{:s/\$\$/ǂ/g<CR>vi{:s/ǂa //<CR>yi{:noh<CR>:echo"MARC normalized for Connexion"<CR>
]])

-- Normalizes human-readable MARC to MARCedit format for copy-pasting.
vim.cmd([[
nnoremap <silent> <leader>medit <Esc><Esc>yi{/}<CR>o{<CR>}<Esc>kpvi{:s/^\(.\)/=\1<CR> vi{:s/^=\(\d\d\d\) /=\1  /<CR>vi{:s/ǂ/\$\$/g<CR><CR>vi{:s/<Space>\(\$\$\)\(.\)/\1\2/g<CR>vi{:s/\(\$\$\)\(.\)<Space>/\1\2/g<CR>vi{:s/\$\$/\$/g<CR>:noh<CR>:echo"MARC normalized for MARCedit"<CR>
]])

-- Seems to avoid issues with VimWikiReturn that I don't fully understand.
vim.cmd([[
imap <CR> <CR>
]])

vim.keymap.set('n', '<leader>home', ':Alpha<CR>', { desc = 'Return to dashboard' })

vim.keymap.set('n', '<leader>tt', ':!thunar .<CR><CR>', {desc = 'Open terminal in current directory', silent = true  })

-- These allow <leader>o (O) to append blank lines after (before) current line without leaving normal mode. They can also be multiplied by a number before the prefix, e.g. 3<leader>o.
vim.cmd([[
nnoremap <silent> <leader>o :<C-u>call append(line("."), repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
]])

vim.keymap.set('n', '<c-Up>', ':resize -1<CR>', { desc = 'resize split' })
vim.keymap.set('n', '<c-Down>', ':resize +1<CR>', { desc = 'resize split' })
vim.keymap.set('n', '<c-left>', ':vertical resize -1<CR>', { desc = 'resize split' })
vim.keymap.set('n', '<c-right>', ':vertical resize +1<CR>', { desc = 'resize split' })

vim.keymap.set({ "n", "i" }, "<Esc>", function()
  vim.cmd([[nohl]]) -- clear highlight of search
  vim.cmd([[stopinsert]]) -- clear messages (the line below statusline)
  for _, win in ipairs(vim.api.nvim_list_wins()) do -- clear all floating windows
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Clear highlight of search, messages, floating windows" })

vim.keymap.set('n', '<F6>', ':NERDTreeToggle<CR>', { desc = 'toggle NERDTree' })

-- Use ctrl-[hjkl] to select the active split!
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { desc = 'select split above', silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { desc = 'select split below', silent = true })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { desc = 'select split left', silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { desc = 'select split right', silent = true })

-- Checkboxes.
vim.keymap.set('n', '<leader>box', '^li [ ]<esc>', { desc = 'make checkbox on current line' })
vim.keymap.set('n', '<leader>ch', '^f]hci[<C-k>OK<esc>', { desc = 'check the checkbox' })
vim.keymap.set('n', '<leader>part', '^f]hci[<C-k>0m<esc>', { desc = 'partially check the checkbox' })
vim.keymap.set('i', '<leader>box', '<Esc>^li [ ]<esc>$', { desc = 'make checkbox on current line' })

-- Shortcut for spellchecking. Auto-corrects last mistake and jumps back to
-- prev. cursor position.
vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', { desc = 'Auto-correct last spelling mistake' })

-- Shortcut for 'select all'
vim.keymap.set('n', '<leader>a', 'ggVG', { desc = 'Select all' })

-- Run command on cursor line.
vim.keymap.set('n', '<leader>run', '"zyy:@z<CR>', { desc = 'Run command on cursor line' })

-- Remap arrow keys to move up or down by DISPLAY lines (like gj/gk)
vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('x', '<Up>', 'gk')
vim.keymap.set('x', '<Down>', 'gj')
vim.keymap.set('i', '<Up>', '<C-O>gk')
vim.keymap.set('i', '<Down>', '<C-O>gj')

-- Hopefully disables middle mouse click (and double/triple/quad click).
vim.keymap.set({ 'n', 'x', 'i' }, '<MiddleMouse>', '<LeftMouse>', { desc = 'Disable middle-click paste' })
vim.keymap.set({ 'n', 'x', 'i' }, '<2-MiddleMouse>', '<nop>', { desc = 'Disable middle-click paste' })
vim.keymap.set({ 'n', 'x', 'i' }, '<3-MiddleMouse>', '<nop>', { desc = 'Disable middle-click paste' })
vim.keymap.set({ 'n', 'x', 'i' }, '<4-MiddleMouse>', '<nop>', { desc = 'Disable middle-click paste' })

vim.keymap.set('i', '<C-BS>', '<C-w>', { desc = 'Ctrl + backspace' })
vim.keymap.set('i', '<C-h>', '<C-w>', { desc = 'Ctrl + backsapce' })

-- .pdf word count macro.
vim.keymap.set('n', '<leader>words', ':!<Space>ps2ascii<Space>%:r.pdf<Space><BAR><Space>wc<Space>-w<CR>', { desc = 'pdf word count' })

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

-- Subfield delimiter!
vim.keymap.set('i', '!$', 'ǂ', { desc = 'Subfield delimiter' })
vim.keymap.set('i', '$!', 'ǂ', { desc = 'Subfield delimiter also' })

-- Open current markdown file in Firefox.
vim.cmd([[ autocmd BufEnter *.md exe 'noremap <F5> :! /usr/bin/firefox %:p<CR><CR>' ]])

-- Open current html file in Firefox
vim.cmd([[ nnoremap <F5>f :exe ':silent !firefox %'<CR> ]])

-- Start vim-instant-markdown
vim.keymap.set('n', '<leader>mark', ':InstantMarkdownPreview<CR>', { desc = 'Start instant markdown preview' })
vim.keymap.set('n', '<leader>nomark', ':InstantMarkdownStop<CR>', { desc = 'Stop instant markdown preview' })

-- Create CSV from current recfile.
vim.api.nvim_create_user_command("CSV", function() 
    -- Get the full path of the current file
    local filepath = vim.fn.expand("%:p")
    if filepath == "" then
        print("No file is open.")
        return
    end

    -- Get the filename without extension
    local filename = vim.fn.expand("%:t:r")

    -- Generate timestamp (YYYYMMDD)
    local timestamp = os.date("%Y%m%d")

    -- Construct the output CSV filename
    local csv_filename = filename .. "_" .. timestamp .. ".csv"

    -- Run the rec2csv command
    local cmd = string.format("rec2csv '%s' > '%s'", filepath, csv_filename)
    vim.fn.system(cmd)

    -- Notify the user
    print("CSV file created: " .. csv_filename)
end, {})

 
---- PLUGINS IN LUA ----------------------------------
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('stevearc/oil.nvim')

-- Plugin for converting MARC 21 bibliographic records between .mrc, .mrk and .xml file formats
Plug('whatupmiked/vim-marc')

Plug('marcweber/vim-addon-mw-utils')
Plug('garbas/vim-snipmate')
Plug('MMinkova/vim-snippets-mrk')


Plug('nvim-lua/plenary.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('nvim-telescope/telescope.nvim')

Plug('vim-voom/VOoM')
  -- let voom_ft_modes = {'markdown': 'pandoc', 'rmd': 'pandoc'}
  -- au BufRead,BufNewFIle *.Rmd command! Toc Voom

Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

Plug('tpope/vim-surround')

Plug('godlygeek/tabular')
-- Plug('preservim/vim-markdown')

-- Plug('masukomi/vim-markdown-folding')

Plug('nvim-tree/nvim-web-devicons')
Plug('echasnovski/mini.icons')

-- Disables weird markdown folding
-- vim.g.vim_markdown_folding_level = 0
-- vim.g.foldenable = 0

-- Distraction-free mode.
Plug 'junegunn/goyo.vim'

  -- Alias to open Goyo because I can never remember that word.
  vim.cmd('command! Mini Goyo')

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
Plug('Mofiqul/dracula.nvim')
Plug('sho-87/kanagawa-paper.nvim')
Plug('navarasu/onedark.nvim')
Plug('projekt0n/github-nvim-theme')

-- recfile syntax highlighting
Plug('zaid/vim-rec')

-- Alpha-related plugins
Plug('goolord/alpha-nvim', { ['lazy'] = true })
Plug('akinsho/bufferline.nvim', { ['dependencies'] = 'nvim-tree/nvim-web-devicons' })
Plug('nvim-lualine/lualine.nvim', { ['dependencies'] = 'nvim-tree/nvim-web-devicons' })

-- vim-instant-markdown
vim.cmd([[ 
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
let g:instant_markdown_theme = 'dark'
]])

Plug('instant-markdown/vim-instant-markdown', {['for'] = 'markdown', ['do'] = 'yarn install'})

-- telescope symbols
Plug('nvim-telescope/telescope-symbols.nvim')

vim.call('plug#end')

-- Telescope key bindings (must be called post-plug#end.
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set("n", "<leader>fa", ":Telescope find_files hidden=true search_dirs=~/<CR>")

-- Lualine setup
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Treesitter configuration (should be called post plugend?)
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "latex", "supercollider"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust", "markdown" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
     additional_vim_regex_highlighting = true,
  },
}

Plug('folke/which-key.nvim', { ['lazy'] = true })

-- Define a local function called "Goyo_enter" which runs a function called "hide" defined in the "lualine" file (that it seeks on its own special PATH). Passes options defined in the "require" bit.
-- In this case the options specify sites of action (statusline, et al.), and whether it hides or unhides.
-- This local function is what we want to call when Goyo is activated, but there is nothing linking the local function to that event yet.
local Goyo_enter = function ()
  require("lualine").hide({
    place = { "statusline", "tabline", "winbar" },
    unhide = false,
    hide = true,
  })
end

-- This defines the opposing local function that we want to call when Goyo closes.
 local function Goyo_leave()
   require("lualine").hide({
     place = { "statusline", "tabline", "winbar" },
     unhide = true,
   })
 end

-- This creates a local function called GoyoGroup comprising a vim auto-group.
local GoyoGroup = vim.api.nvim_create_augroup("GoyoGroup", { clear = true })

-- The following two autocommands are grouped together by passing the "group" option to the create_autocmd function. The pattern is what triggers the autocommand and the callback is what runs (our earlier defined local functions).
-- I'm not really sure why these need to be grouped together though.
-- I guess they don't have to (I tried separating them) -- it's just best practice?
 vim.api.nvim_create_autocmd("User", {
   pattern = "GoyoEnter",
   callback = Goyo_enter,
   group = GoyoGroup,
 })

vim.api.nvim_create_autocmd("User", {
  pattern = "GoyoLeave",
  callback = Goyo_leave,
  group = GoyoGroup,
})


---- END OF LUA --------------------------------------

-- If editing vimscript, use "set syntax=vim" to make things a little more pleasant.

vim.cmd([[

" Required by vim-markdown-folding
"set nocompatible
"if has("autocmd")
"    filetype plugin indent on
"endif

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

    autocmd FileType tex,latex inoremap <leader>item \begin{itemize}<CR>\item<CR>\end{itemize}<Esc>k$a<Space>

    " Encloses text in \emph{}
    autocmd FileType tex,latex vnoremap <C-e> c\emph{<C-r>"}<Esc>
    " Encloses text in \textbf{}
    autocmd FileType tex,latex vnoremap <C-b> c\textbf{<C-r>"}<Esc>

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

" Keybindings
nnoremap <Leader>di <Plug>VimwikiDiaryIndex
nnoremap <Leader>dd <Plug>VimwikiMakeDiaryNote

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
" let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Automatically update links on read diary
    command! Diary VimwikiDiaryIndex
    augroup vimwikigroup
        autocmd!
        autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
    augroup end

" sets vimwiki folding behavior (can be '' to disable
" 'expr' 'syntax' or 'list')
let g:vimwiki_folding='syntax'

" Should auto-update vimwiki diary index whenever it's reloaded
" let g:vimwiki_list = [{'auto_diary_index': 1}]
    autocmd BufEnter diary.md :VimwikiDiaryGenerateLinks

" Should override vimwiki syntax settings in favor of typical markdown 
au BufRead,BufWinEnter,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn} setlocal filetype=markdown
au BufRead,BufWinEnter,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setlocal filetype=markdown

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

" Changes markdown comment string for vim.commentary to .html
autocmd FileType markdown setlocal commentstring=<!--\ %s\ -->

]])

-- With lua you can run arbitrary functions triggered by key mappings:
-- vim.keymap.set("n", "<leader>$", function()
--     print("hello isaac")
-- end)
