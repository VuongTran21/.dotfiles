return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      modules = {},
      sync_install = false,
      ignore_install = {},
      highlight = {
        enable = true
      },
      indent = { enable = true },
      autotage = { enable = true },
      ensure_installed = {
        "json",
        "python",
        "javascript",
        "query",
        "typescript",
        "tsx",
        "rust",
        "zig",
        "php",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "vimdoc",
        "c",
        "dockerfile",
        "gitignore",
      },
      auto_install = false,
    })
  end
}
