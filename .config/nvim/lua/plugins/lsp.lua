return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local keymap = vim.keymap
    local lsp = require("lspconfig")

    local onAttach = function(client, bufnr)
      local options = { noremap = true, silent = true, buffer = bufnr }

      keymap.set("n", "<leader><F1>", "<cmd>Telescope lsp_references<CR>", options)
      keymap.set("n", "<leader><F2>", vim.lsp.buf.rename, options)
      keymap.set("n", "<leader><F3>", vim.lsp.buf.code_action, options)

      keymap.set("n", "<leader><F4>", "<cmd>Telescope lsp_implementations<CR>", options)
      keymap.set("n", "<leader><F5>", "<cmd>Telescope lsp_type_definitions<CR>", options)

      keymap.set("n", "<leader><F6>", "<cmd>Telescope diagnostics bufnr=0<CR>", options)
      keymap.set("n", "<leader><F7>", vim.diagnostic.goto_prev, options)
      keymap.set("n", "<leader><F8>", vim.diagnostic.goto_next, options)
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup_handlers({
      function(serverName)
        lsp[serverName].setup({
          on_attach = onAttach,
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        lsp.lua_ls.setup({
          on_attach = onAttach,
          capabilities = capabilities,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      ["svelte"] = function()
        lsp.svelte.setup({
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)

            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                if client.name == "svelte" then
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                end
              end,
            })
          end,
        })
      end,
    })
  end,
}
