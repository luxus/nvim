-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
-- Add any additional options here
vim.opt.relativenumber = true -- sets vim.opt.relativenumber
vim.opt.number = true -- sets vim.opt.number
vim.opt.spell = false -- sets vim.opt.spell
vim.opt.signcolumn = "auto" -- sets vim.opt.signcolumn to auto
vim.opt.wrap = false -- sets vim.opt.wrap
vim.opt.clipboard = "" -- Remove connection to the system clipboard
vim.opt.timeoutlen = 250
vim.opt.backup = false -- Don't store backup while overwriting the file
vim.opt.ruler = false -- Don't show cursor position in command line
vim.opt.incsearch = true -- Show search results while typing
vim.opt.completeopt = "menuone,noinsert,noselect" -- Customize completions
vim.opt.formatoptions = "qjl1" -- Don't autoformat comments
vim.opt.splitkeep = "screen" -- Reduce scroll during window
vim.opt.pumblend = 10 -- Make builtin completion menus slightly transparent
vim.opt.winblend = 10 -- Make floating windows slightly transparent
vim.opt.listchars = "extends:…,precedes:…,nbsp:␣" -- Define which helper symbols to show
vim.opt.list = true -- Show some helper symbols
vim.g.mapleader = " " -- sets vim.g.mapleader
vim.g.inlay_hints_enabled = true
-- vim.g.lsp_handlers_enabled = true
