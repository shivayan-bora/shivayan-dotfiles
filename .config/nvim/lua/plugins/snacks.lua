return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    image = {
      enabled = true,
      width = 0.7,
      height = 0.7,
      render_method = "kitty", -- Works with Ghostty

      -- Add custom path handling for Obsidian (similar to your image.nvim config)
      markdown = {
        resolve_image_path = function(document_path, image_path)
          local vault_dir = "/Users/shivayanbora/PKM/My-Wiki-Vault"
          if document_path:find(vault_dir, 1, true) then
            return vault_dir .. "/assets/" .. image_path
          end
          return image_path
        end,
      },
    },
  },
}
