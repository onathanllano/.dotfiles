return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  keys = {
    { "<leader>fe", "<cmd>Telescope file_browser<CR>" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    { "<leader>fl", "<cmd>Telescope live_grep<CR>" },
    { "<leader>fg", "<cmd>Telescope grep_string<CR>" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>" },
    { "<leader>ht", "<cmd>Telescope help_tags<CR>" },
  },
  config = function()
    local telescope = require("telescope")
    local telescopeActions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = telescopeActions.move_selection_previous,
            ["<C-j>"] = telescopeActions.move_selection_next,
            ["<C-q>"] = telescopeActions.send_selected_to_qflist + telescopeActions.open_qflist,
          },
        },
      },
      pickers = {
        diagnostics = {
          line_width = "full",
        },
      },
    })

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("ui-select")

    telescope.load_extension("fzf")
  end,
}
