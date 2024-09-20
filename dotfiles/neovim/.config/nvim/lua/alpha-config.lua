-- alpha-config.lua

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

[[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣶⣄⡀   ]],
[[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄  ]],
[[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷  ]],
[[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⠙⣿⣿⡿  ]],
[[  ⠀⠀⠀⠀⠀⢀⣠⠶⠛⠁⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣄⣠⣿⡿⠁  ]],
[[  ⠀⠀⣀⡤⠞⠉⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀  ]],
[[  ⢀⡾⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀  ]],
[[  ⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⡀⠙⢿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
[[  ⣿⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⡿⠟⢋⣤⠶⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
[[  ⠘⣧⡀⠀⢰⣿⣶⣿⠿⠛⣩⡴⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
[[  ⠀⠈⠛⠦⣤⣤⣤⡤⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],

}

 dashboard.section.buttons.val = {
   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("f", "  Find file", ":Telescope find_files hidden=true search_dirs=~/<CR>"),
   dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
   dashboard.button("c", "  init.lua", ":e ~/.config/nvim/init.lua<CR>"),
   dashboard.button("d", "  Dash config", ":e ~/.config/nvim/lua/alpha-config.lua<CR>"),
   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
 return "otto-vim"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

-- [[          ▀████▀▄▄              ▄█ ]],
-- [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
-- [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
-- [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
-- [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
-- [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
-- [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
-- [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
-- [[   █   █  █      ▄▄           ▄▀   ]],

