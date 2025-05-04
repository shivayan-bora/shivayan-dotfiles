return {
  "benlubas/molten-nvim",
  dependencies = {
    "3rd/image.nvim",
  },
  build = ":UpdateRemotePlugins",
  init = function()
    -- Configure Python path for Molten
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_image_provider = "image.nvim"
    -- Use your Anaconda Python
    vim.g.molten_python_executable = "/opt/homebrew/anaconda3/bin/python"
  end,
  config = function()
    vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Initialize Molten for current buffer" })
    vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>", { desc = "Run cell" })
    vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", { desc = "Re-run cell" })
    vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "Delete cell" })
    vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "Hide output" })
  end,
}
