-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Add these performance optimizations
local opt = vim.opt

-- Improve performance
opt.redrawtime = 1500 -- Time limit for syntax highlighting (ms)
opt.updatetime = 250 -- Faster completion
opt.timeoutlen = 300 -- Faster key mapping timeouts
opt.lazyredraw = false -- Don't redraw while executing macros (good performance)

-- File finding optimizations
opt.path:remove("/usr/include")
opt.wildignore:append({
  "*/node_modules/*",
  "*/dist/*",
  "*/build/*",
  "*/.git/*",
  "*.min.js",
  "package-lock.json",
  "yarn.lock",
  "pnpm-lock.yaml",
  "*/.next/*",
})

-- LSP performance for large files
vim.g.lsp_max_filesize = 10 * 1024 * 1024 -- 10MB max file size for LSP

-- Optimize for large files
vim.g.loaded_matchparen = 1 -- Don't highlight matching parentheses

-- Set up Python provider
vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/3.10.0/bin/python3")

-- Disable Perl provider to remove the warning
vim.g.loaded_perl_provider = 0
