-- You can also add new plugins here as well using the lazy syntax:
return {
  -- changes to astronvim included plugins
  { "better-escape.nvim", enabled = false },
  { "nvim-autopairs", enabled = false },
  { "which-key.nvim", enabled = false, opts = { window = { winblend = 10 } } },
  {
    "smart-splits.nvim",
    opts = function(_, opts) opts.at_edge = require("smart-splits.types").AtEdgeBehavior.stop end,
  },
  {
    "nvim-notify",
    opts = {
      stages = "slide",
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    },
  },
  {
    "gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = { ignore_whitespace = true },
      numhl = true,
      signcolumn = false,
    },
  },
  {
    "toggleterm.nvim",
    keys = {
      { "<C-BS>", mode = { "t" }, "<C-\\><C-n>", desc = "Terminal normal mode" },
      { "<esc><esc>", mode = { "t" }, "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    },
    opts = { terminal_mappings = false },
  },
  {
    "lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      opts.preset = "codicons"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
      return opts
    end,
  },
  {
    "neo-tree.nvim",
    enabled = false,
    dependencies = {
      "miversen33/netman.nvim",
      {
        "adelarsq/image_preview.nvim",
        opts = {},
      },
    },
    opts = {
      sources = {
        "filesystem",
        "netman.ui.neo-tree",
        "git_status",
      },
      source_selector = {
        winbar = false,
        statusline = false,
        sources = {
          { source = "filesystem", display_name = require("astroui").get_icon "FolderClosed" .. " File" },
          { source = "remote", display_name = "󰒍 Remote" },
          { source = "git_status", display_name = require("astroui").get_icon "Git" .. " Git" },
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_default",
        filtered_items = {
          always_show = { ".github", ".gitignore" },
        },
      },
    },
  },
  -- additional plugins
  {
    "echasnovski/mini.move",
    keys = {
      { "<leader>m", mode = "n", desc = "Move" },
      { "<leader>m", mode = "x", desc = "Move" },
    },
    opts = {
      mappings = {
        left = "<Leader>mh",
        right = "<Leader>ml",
        down = "<Leader>mj",
        up = "<Leader>mk",
        line_left = "<Leader>mh",
        line_right = "<Leader>ml",
        line_down = "<Leader>mj",
        line_up = "<Leader>mk",
      },
    },
  },
  {
    "echasnovski/mini.clue",
    event = "VeryLazy",
    config = function()
      local miniclue = require "mini.clue"
      miniclue.setup {
        window = {
          delay = 100,
        },
        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },
          -- `[ & ]` key
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },
          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows {
            submode_move = true,
            submode_navigate = true,
            submode_resize = true,
          },
          miniclue.gen_clues.z(),
          { mode = "n", keys = "<Leader>b", desc = "+Buffers" },
          { mode = "n", keys = "<Leader>bs", desc = "+Sort" },
          { mode = "n", keys = "<Leader>d", desc = "+Diagnostics" },
          { mode = "n", keys = "<Leader>g", desc = "+Git" },
          { mode = "n", keys = "<Leader>gn", desc = "+NeoGit" },
          { mode = "n", keys = "<Leader>S", desc = "+Sessions" },
          { mode = "n", keys = "<Leader>p", desc = "+Plugins" },
          { mode = "n", keys = "<Leader>t", desc = "+Terminal" },
          { mode = "n", keys = "<Leader>u", desc = "+Toggle UI" },
          { mode = "n", keys = "<Leader>x", desc = "+Trouble" },
          { mode = "n", keys = "<Leader><TAB>", desc = "+TAB" },
          { mode = "n", keys = "<Leader>l", desc = "+LSP" },
          { mode = "n", keys = "]b", postkeys = "]" },
          { mode = "n", keys = "]w", postkeys = "]" },
          { mode = "n", keys = "[b", postkeys = "[" },
          { mode = "n", keys = "[w", postkeys = "[" },
          { mode = "n", keys = "]B", postkeys = "]" },
          { mode = "n", keys = "]W", postkeys = "]" },
          { mode = "n", keys = "[B", postkeys = "[" },
          { mode = "n", keys = "[W", postkeys = "[" },
          { mode = "n", keys = "<Leader>mh", postkeys = "<Leader>m" },
          { mode = "n", keys = "<Leader>mj", postkeys = "<Leader>m" },
          { mode = "n", keys = "<Leader>mk", postkeys = "<Leader>m" },
          { mode = "n", keys = "<Leader>ml", postkeys = "<Leader>m" },
          { mode = "x", keys = "<Leader>mh", postkeys = "<Leader>m" },
          { mode = "x", keys = "<Leader>mj", postkeys = "<Leader>m" },
          { mode = "x", keys = "<Leader>mk", postkeys = "<Leader>m" },
          { mode = "x", keys = "<Leader>ml", postkeys = "<Leader>m" },
          { mode = "n", keys = "<Leader>s", desc = "+Search & Replace" },
          { mode = "n", keys = "<Leader>f", desc = "+Telescope" },
        },
      }
    end,
  },
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>e",
        function() require("mini.files").open() end,
        desc = "Explorer",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          vim.keymap.set("n", "<ESC>", function() require("mini.files").close() end, { buffer = args.buf_id })
        end,
      })
    end,
    opts = {},
  },
}
