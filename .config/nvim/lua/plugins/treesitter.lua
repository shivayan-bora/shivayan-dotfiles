return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    -- Needed for WSL
    -- require("nvim-treesitter.install").compilers = { "zig" }

    require("nvim-treesitter.configs").setup({
      -- Required fields to suppress warnings
      sync_install = false,
      ignore_install = {},
      modules = {},
      auto_install = true,

      -- Your existing configuration
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "latex", -- Essential for LaTeX support
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "latex" },
      },
    })
  end,
}
