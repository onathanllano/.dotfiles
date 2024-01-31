return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  config = function()
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "css",
        "diff",
        "dockerfile",
        "graphql",
        "html",
        "java",
        "javascript",
        "json",
        "json5",
        "markdown",
        "prisma",
        "python",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    })
  end,
}
