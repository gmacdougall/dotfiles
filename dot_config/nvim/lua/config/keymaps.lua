-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Buffer management
for n = 1, 9 do
  map("n", "<leader>" .. n, "<cmd>BufferLineGoToBuffer " .. n .. "<cr>", { desc = "Select Buffer " .. n })
end
map("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Pick a buffer" })
