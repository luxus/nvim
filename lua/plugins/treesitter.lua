if true then return {} end -- REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Exapmle customization of Treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-context", config = true },
  },
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = "<nop>",
        node_decremental = "<bs>",
      },
    },
    auto_install = vim.fn.executable "tree-sitter" == 1,
    highlight = { disable = { "help", "latex" } },
    indent = { enable = true },
  },
}
