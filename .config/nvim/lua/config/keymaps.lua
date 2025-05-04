-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Navigation:
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- Obsidian keymaps
map("n", "<leader>zn", "<cmd>ObsidianNew<CR>")
map("n", "<leader>zb", "<cmd>ObsidianBacklinks<CR>")
map("v", "<leader>zl", "<cmd>ObsidianLinkNew <CR>")
map("v", "<leader>ze", "<cmd>ObsidianExtractNote<CR>")
map("n", "<leader>zt", "<cmd>ObsidianTags<CR>")

-- Neorg keymaps:
-- map("n", "<leader>zc", "<cmd>Neorg toc<CR>")
-- map("n", "<leader>zs", "<cmd>Neorg generate-workspace-summary<CR>")
-- map("n", "<leader>zn", "<cmd>Neorg templates load<CR>")
-- map("n", "<leader>zti", "<cmd>Telescope neorg insert_link<CR>")
-- map("n", "<leader>ztfl", "<cmd>Telescope neorg find_linkable<CR>")
-- map("n", "<leader>ztfh", "<cmd>Telescope neorg search_headings<CR>")
-- map("n", "<leader>ztfb", "<cmd>Telescope neorg find_backlinks<CR>")
-- map("n", "<leader>z<CR>", "neorg.itero.next-iteration")
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
