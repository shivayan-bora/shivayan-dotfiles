-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Force concealment in markdown files
    vim.opt_local.conceallevel = 3 -- Maximum concealment
    vim.opt_local.concealcursor = "nvic" -- Conceal in all modes

    -- This is crucial for Obsidian+LaTeX
    vim.cmd([[syntax match markdownMathEnv /\$.*\$/ conceal]])
    vim.cmd([[syntax match markdownMathEnv /\$\$.*\$\$/ conceal]])
  end,
})

-- Add to lua/config/autocmds.lua
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    if vim.bo[args.buf].filetype == "html" then
      vim.bo[args.buf].formatexpr = nil
      vim.b.autoformat = true
    end
  end,
})
