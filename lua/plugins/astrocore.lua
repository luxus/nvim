local tabpre = "<leader><tab>"

return {
  "AstroNvim/astrocore",
  opts = {
    features = {
      max_file = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Mapping data with "desc" stored directly by vim.keymap.set().
    --
    -- Please use this mappings table to set keyboard mapping since this is the
    -- lower level configuration and more robust one. (which-key will
    -- automatically pick-up stored data by this setting.)
    mappings = {
      n = {
        ["<leader>o"] = false, -- focus neo-tree
        ["q:"] = ":",

        ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
        ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
        ["<leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
        -- tabs
        [tabpre] = { desc = "󰓩 Tab Managment" },
        [tabpre .. "l"] = { "<cmd>tablast<cr>", desc = "Last Tab" },
        [tabpre .. "f"] = { "<cmd>tabfirst<cr>", desc = "First Tab" },
        [tabpre .. "<tab>"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
        [tabpre .. "]"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
        [tabpre .. "["] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
        -- Copy/paste with system clipboard
        ["gy"] = { '"+y', desc = "Copy to system clipboard" },
        ["gp"] = { '"+p', desc = "Paste from system clipboard" },
        ["gP"] = { '"+P', desc = "Paste from system clipboard" },
      },
      i = {
        -- Move with alt in insert, terminal and command
        -- Don't `noremap` in insert mode to have these keybindings behave exactly
        -- like arrows (crucial inside TelescopePrompt)
        ["<M-h>"] = { "<Left>", noremap = false, desc = "Left" },
        ["<M-j>"] = { "<Down>", noremap = false, desc = "Down" },
        ["<M-k>"] = { "<Up>", noremap = false, desc = "Up" },
        ["<M-l>"] = { "<Right>", noremap = false, desc = "Right" },
      },
      v = {

        -- Search inside visually highlighted text. Use `silent = false` for it to
        -- make effect immediately.
        ["g/"] = { "<esc>/\\%V", silent = false, desc = "Search inside visual selection" },
        ["gV"] = { '"`[" . strpart(getregtype(), 0, 1) . "`]"', expr = true, desc = "Visually select changed text" },
        ["gy"] = { '"+y', desc = "Copy to system clipboard" },
        ["gp"] = { '"+p', desc = "Paste from system clipboard" },
        ["gP"] = { '"+P', desc = "Paste from system clipboard" },
        -- Search visually selected text (slightly better than builtins in Neovim>=0.8)
        ["*"] = { [[y/\V<C-R>=escape(@", '/\')<CR><CR>]] },
        ["#"] = { [[y?\V<C-R>=escape(@", '?\')<CR><CR>]] },
      },
      t = {
        ["<M-h>"] = { "<Left>", desc = "Left" },
        ["<M-j>"] = { "<Down>", desc = "Down" },
        ["<M-k>"] = { "<Up>", desc = "Up" },
        ["<M-l>"] = { "<Right>", desc = "Right" },
      },
      c = {
        ["<M-h>"] = { "<Left>", silent = false, desc = "Left" },
        ["<M-l>"] = { "<Right>", silent = false, desc = "Right" },
      },
    },
  },
}
