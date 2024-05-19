return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = { "progress", "location" },
        lualine_y = { "encoding", "file_format", "filename" },
        lualine_z = { "filetype" },
      },
    })
  end,
}
