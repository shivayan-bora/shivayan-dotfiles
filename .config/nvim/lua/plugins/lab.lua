return {
  "0x100101/lab.nvim",
  build = "cd js && npm ci",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("lab").setup({
      -- add any lab.nvim configuration options here (if needed)
    })
  end,
}
