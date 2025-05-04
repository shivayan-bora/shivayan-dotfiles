return {
  -- Configure LazyVim to use your preferred scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin", -- Prevent LazyVim from overriding
    },
  },

  -- Catppuccin configuration
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensure early loading
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },
}
