-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Frontend specific keymaps
-- keymaps.lua
-- Helper function to get diagnostics under cursor
local function get_diagnostics_under_cursor()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1] - 1
  return vim.diagnostic.get(0, { lnum = line })
end

-- Normal mode code action with diagnostics included
vim.keymap.set("n", "<leader>ca", function()
  vim.lsp.buf.code_action({
    context = {
      diagnostics = get_diagnostics_under_cursor(),
    },
  })
end, { desc = "Code actions" })

-- TypeScript-specific code actions
vim.keymap.set("n", "<leader>tai", function()
  vim.lsp.buf.code_action({
    context = {
      only = { "source.addMissingImports.ts" },
      diagnostics = get_diagnostics_under_cursor(),
    },
    apply = true,
  })
end, { desc = "Add missing imports" })

vim.keymap.set("n", "<leader>toi", function()
  vim.lsp.buf.code_action({
    context = {
      only = { "source.organizeImports.ts" },
      diagnostics = get_diagnostics_under_cursor(),
    },
    apply = true,
  })
end, { desc = "Organize imports" })

-- Visual mode code action with range diagnostics
vim.keymap.set("v", "<leader>ca", function()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local start_line = start_pos[2] - 1
  local end_line = end_pos[2] - 1

  local range_diagnostics = vim.diagnostic.get(0, {
    lnum = { min = start_line, max = end_line },
  })

  vim.lsp.buf.code_action({
    context = {
      diagnostics = range_diagnostics,
    },
  })
end, { desc = "Code actions (range)" })
