return {
  "olrtg/nvim-emmet",
  lazy = false,
  config = function()
    vim.keymap.set({ "n", "v" }, "<leader>ze", require("nvim-emmet").wrap_with_abbreviation)
  end,
}
