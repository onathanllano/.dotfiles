-- Leader key map
vim.g.mapleader = " "

local keymap = vim.keymap

-- Save
keymap.set("n", "<leader>s", ":w <CR>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
