return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local masonLspConfig = require("mason-lspconfig")
    local masonToolInstaller = require("mason-tool-installer")

    mason.setup()

    masonLspConfig.setup({
      ensure_installed = {
        "bashls",
        "cssls",
        "cssmodules_ls",
        "dockerls",
        "html",
        "jsonls",
        "tsserver",
        "lua_ls",
        "marksman",
        "sqlls",
        "svelte",
        "taplo",
        "tailwindcss",
        "yamlls",
      },
      automatic_installation = true,
    })

    masonToolInstaller.setup({
      ensure_installed = {
        "eslint_d",
        "prettierd",
        "stylua",
      },
      auto_update = true,
      run_on_start = true,
    })
  end,
}
