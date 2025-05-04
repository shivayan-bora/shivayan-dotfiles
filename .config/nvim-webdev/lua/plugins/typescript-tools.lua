return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      settings = {
        -- Properly expose TypeScript code actions to avoid type warnings
        expose_as_code_action = {
          "add_missing_imports",
          "remove_unused",
          "remove_unused_imports",
          "organize_imports",
        },
      },
    },
  },
}
