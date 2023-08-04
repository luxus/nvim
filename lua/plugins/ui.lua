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
}
