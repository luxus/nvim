return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    status = { separators = { breadcrumbs = "  ", path = "/" } },
    colorscheme = "astrodark", -- change colorscheme
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
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
        inactive = true, -- Bool value, toggles inactive window color.
        transparent = false, -- Bool value, toggles transperency.
        floating = true, -- Bool value, toggles floating windows background colors.
        popup = true, -- Bool value, toggles popup background color.
        neotree = false, -- Bool value, toggles neo-trees background color.
        italic_comments = true, -- Bool value, toggles italic comments.
      },
    },
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
        -- {
        --   provider = function() return "  " .. os.date "%R" end,
        -- },
        status.component.mode { padding = { left = 0, right = 0 }, surround = { separator = "right" } },
      }
      opts.tabline[2] = status.heirline.make_buflist(status.component.tabline_file_info { close_button = false })
      opts.winbar = nil
    end,
  },
}
