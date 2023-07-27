-- You can also add new plugins here as well using the lazy syntax:
return {
  -- disable some stuff
  { "better-escape.nvim", enabled = false },
  { "nvim-autopairs", enabled = false },
  { "mason.nvim", opts = { PATH = "append" } }, -- Mason binaries will have the lowest priority
  { "theHamsta/nvim-dap-virtual-text", opts = {} },
  { "which-key.nvim", opts = { window = { winblend = 10 } } },
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
    "heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline[9] = status.component.lsp { lsp_progress = false }
      opts.statusline = {
        -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        status.component.diagnostics { padding = { left = 0 } },
        status.component.file_info { -- add file_info to breadcrumbs
          file_icon = { padding = { left = 0 } },
          filename = false,
          padding = { left = 0 },
        },
        status.component.separated_path {
          padding = { left = 0 },
          path_func = status.provider.filename { modify = ":.:h" },
        },
        status.component.file_info { -- add file_info to breadcrumbs
          file_icon = false,
          file_modified = false,
          padding = { left = 0 },
        },
        status.component.breadcrumbs {
          icon = { hl = true },
          prefix = false,
          padding = { left = 0 },
        },
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.git_diff {
          padding = { right = 0 },
        },
        status.component.nav { padding = { left = 0, right = 0 }, percentage = false, scrollbar = false },
        {
          provider = function() return "  " .. os.date "%R" end,
        },
        status.component.mode { padding = { left = 0, right = 0 }, surround = { separator = "right" } },
      }
      opts.tabline[2] = status.heirline.make_buflist(status.component.tabline_file_info { close_button = false })
      opts.winbar = nil
    end,
  },
  {
    "nvim-treesitter",
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
  },
  {
    "astrotheme",
    opts = {
      palette = "astrodark", -- String of the default palette to use when calling `:colorscheme astrotheme`
      background = { -- :h background, palettes to use when using the core vim background colors
        light = "astrolight",
        dark = "astrodark",
      },
      style = {
        inactive = false, -- Bool value, toggles inactive window color.
        transparent = true, -- Bool value, toggles transperency.
        floating = false, -- Bool value, toggles floating windows background colors.
        popup = false, -- Bool value, toggles popup background color.
        neotree = false, -- Bool value, toggles neo-trees background color.
        italic_comments = true, -- Bool value, toggles italic comments.
      },
    },
  },
  {
    "todo-comments.nvim",
    keys = {
      -- { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      -- { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
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

  {
    "portal.nvim",
    dependencies = {
      "cbochs/grapple.nvim",
      enabled = true,
      dependencies = { "nvim-lua/plenary.nvim" },
      keys = {
        { "<leader> ", function() require("grapple").popup_tags() end, desc = "Grapple" },
        { "<leader>a", function() require("grapple").toggle() end, desc = "Tag in Grapple" },
        { "<leader>1", function() require("grapple").select { key = 1 } end, desc = "Grapple 1" },
        { "<leader>2", function() require("grapple").select { key = 2 } end, desc = "Grapple 2" },
        { "<leader>3", function() require("grapple").select { key = 3 } end, desc = "Grapple 3" },
        { "<leader>4", function() require("grapple").select { key = 4 } end, desc = "Grapple 4" },
      },
    },
  },
  {
    "noice.nvim",
    opts = {
      messages = { enabled = true },
      cmdline = {
        format = {
          filter = { pattern = "^:%s*!", icon = "$ ", ft = "sh" },
          IncRename = {
            pattern = "^:%s*IncRename%s+",
            icon = " ",
            conceal = true,
          },
        },
      },
      views = {
        cmdline_popup = {
          border = { style = "none", padding = { 1, 2 } },
          win_options = {
            winblend = 5,
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "NoiceCmdlinePopupBorder",
              IncSearch = "",
              Search = "",
            },
            cursorline = false,
          },
        },
      },
      popupmenu = {
        enabled = true,
      },
      routes = {
        { view = "notify", filter = { event = "msg_showmode" } },
        { filter = { event = "msg_show", find = "%d+L, %d+B" }, view = "mini" },
        {
          view = "cmdline_output",
          filter = { cmdline = "^:", min_height = 5 },
          -- BUG: will be fixed after https://github.com/neovim/neovim/issues/21044 gets merged
        },
        { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "; before #" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "; after #" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = " lines, " }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "go up one level" }, opts = { skip = true } },
        { filter = { event = "msg_show", find = "yanked" }, opts = { skip = true } },
        { filter = { find = "No active Snippet" }, opts = { skip = true } },
        { filter = { find = "waiting for cargo metadata" }, opts = { skip = true } },
      },
      presets = {
        inc_rename = true,
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = "rounded",
      },
    },
  },
  {
    "copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
          --dismiss = false,
        },
      },
    },
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
}
