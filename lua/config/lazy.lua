local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- TODO: set to true on release
-- Whether or not to use stable releases of AstroNvim
local USE_STABLE = false

local spec = {
  -- TODO: remove branch v4 on release
  { "AstroNvim/AstroNvim", branch = "v4", version = USE_STABLE and "*" or nil, import = "astronvim.plugins" },
  -- { "AstroNvim/AstroNvim", version = "3.x", import = "astronvim.plugins" }, -- use this line to only get updates for v3 and avoid the breaking changes if v4 is released
}
if USE_STABLE then table.insert(spec, { import = "astronvim.lazy_snapshot" }) end -- pin plugins to known stable versions/commits

require("lazy").setup {
  spec = vim.list_extend(spec, {
    -- AstroCommunity import any community modules here
    { "AstroNvim/astrocommunity", dev = true },
    { import = "astrocommunity.pack.svelte" },
    { import = "astrocommunity.pack.nix" },
    { import = "astrocommunity.color.headlines-nvim" },
    { import = "astrocommunity.pack.go", enabled = false },
    { import = "astrocommunity.pack.typescript-all-in-one", enabled = false },
    { import = "astrocommunity.pack.rust", enabled = false },
    { import = "astrocommunity.pack.docker", enabled = false },
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.editing-support.todo-comments-nvim", enabled = true },
    { import = "astrocommunity.lsp.inc-rename-nvim", enabled = true },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.html-css" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.pack.tailwindcss" },
    { import = "astrocommunity.utility.noice-nvim" },
    { import = "astrocommunity.completion.copilot-lua" },
    { import = "astrocommunity.motion.flash-nvim" },
    { import = "astrocommunity.motion.mini-surround" },
    { import = "astrocommunity.motion.mini-move", enabled = true },
    { import = "astrocommunity.motion.mini-surround", enabled = true },
    { import = "astrocommunity.motion.mini-bracketed", enabled = true },
    { import = "astrocommunity.motion.mini-move" },
    { import = "astrocommunity.motion.mini-ai" },
    { import = "astrocommunity.motion.portal-nvim" },
    { import = "astrocommunity.editing-support.mini-splitjoin" },
    { import = "astrocommunity.indent.indent-blankline-nvim", enabled = true },
    { import = "astrocommunity.indent.mini-indentscope", enabled = true },
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim", enabled = true },
    { import = "astrocommunity.comment.mini-comment", enabled = true },
    { import = "astrocommunity.media.vim-wakatime", enabled = true },
    { import = "astrocommunity.project.nvim-spectre", enabled = true },
    { import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },
    { import = "astrocommunity.code-runner.sniprun", enabled = true },
    { import = "astrocommunity.editing-support.dial-nvim", enabled = true },
    { import = "astrocommunity.comment.mini-comment" },
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    { import = "astrocommunity.utility.noice-nvim" },
    { import = "astrocommunity.editing-support.todo-comments-nvim" },
    { import = "astrocommunity.editing-support.dial-nvim" },
    { import = "astrocommunity.scrolling.mini-animate" },
    { import = "astrocommunity.indent.mini-indentscope" },
    { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
    { import = "astrocommunity.git.neogit" },
    { import = "astrocommunity.media.vim-wakatime" },
    { import = "astrocommunity.motion.mini-ai", enabled = true },
    { import = "astrocommunity.motion.portal-nvim", enabled = true },
    { import = "astrocommunity.editing-support.mini-splitjoin", enabled = true },
    { import = "astrocommunity.project.nvim-spectre" },
    { import = "plugins" }, -- import/override with your plugins
  }),
  defaults = {
    -- By default, only AstroNvim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
  },
  install = { colorscheme = { "astrodark" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
}
