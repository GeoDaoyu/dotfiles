-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Esc
keymap.set("i", "jj", "<Esc>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- fix: <C-o>l works good in vim, but stupid in neovim
keymap.set("i", "<C-o>l", "<right>", opts)
keymap.set("i", "<C-o>2l", "<right><right>", opts)
