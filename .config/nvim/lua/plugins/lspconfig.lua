return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      html = {

        settings = {
          format = {
            templating = true,
            wrapLineLength = 120,
            wrapAttributes = "auto",
          },
        },
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = true,
              },
            },
          },
        },
      },
      emmet_language_server = {
        filetypes = {
          "html",
          "css",
          "javascriptreact",
          "typescriptreact",
          "scss",
          "sass",
          "less",
        },
      },
      tailwindcss = {
        root_dir = require("lspconfig.util").root_pattern("tailwind.config.js", "tailwind.config.ts"),
        filetypes = {
          "css",
          "scss",
          "sass",
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "svelte",
          "heex",
          "elixir",
        },
      },
      angularls = {},
    },
  },
}
