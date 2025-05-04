return {
  {
    "folke/snacks.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Setting this option prevents snacks from creating a <leader>ua mapping
      if not opts.toggle then
        opts.toggle = {}
      end
      opts.toggle.keymaps = false

      return vim.tbl_deep_extend("force", opts or {}, {
        -- Enable image support
        image = {
          enabled = true,
        },
        -- Disable scroll animations
        scroll = {
          enabled = true,
        },
        -- Enable statuscolumn
        statuscolumn = {
          enabled = true,
        },
        -- Explicitly disable toggling via config
        toggle = {
          keymaps = false, -- Disable default keymaps
        },
      })
    end,
  },
}
