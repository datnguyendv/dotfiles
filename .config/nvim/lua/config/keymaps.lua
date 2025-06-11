-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move
vim.api.nvim_set_keymap("n", "ml", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "ml", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "mh", "0", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "mh", "0", { noremap = true, silent = true })
