-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.conceallevel = 2
vim.g.markdown_conceal = 1
vim.g.tex_conceal = "admgs" -- Conceal various LaTeX elements
vim.g.vim_markdown_math = 1 -- Enable math concealment in markdown
vim.opt.wrap = true
vim.opt.linebreak = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.g.lazyvim_no_inlay_hints = true

vim.o.updatetime = 100
vim.o.timeoutlen = 300

vim.opt.termguicolors = true
-- vim.g.python3_host_prog = "/Users/shivayanbora/.pyenv/versions/neovim3/bin/python"
vim.g.python3_host_prog = "/opt/homebrew/anaconda3/bin/python"
vim.g.loaded_perl_provider = 0
