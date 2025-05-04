return {
  -- Extend TypeScript and frontend framework support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "scss",
          "vue",
          "astro",
          "svelte",
          "graphql",
          "http",
        })
      end
    end,
  },

  -- Configure LSP servers for your frontend tech stack
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- TypeScript
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
              suggest = {
                completeFunctionCalls = true,
                autoImports = true,
              },
              updateImportsOnFileMove = { enabled = "always" },
              maxTsServerMemory = 4096, -- Increase for larger projects
            },
          },
        },
      },
    },
  },

  -- Tailwind CSS color highlighting in completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- Add tailwind colors to completion
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },

  -- Enhanced tag handling for HTML, JSX, TSX
  {
    "windwp/nvim-ts-autotag",
    opts = {
      -- New format with options directly at root level
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
      filetypes = {
        "html",
        "xml",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "php",
        "markdown",
      },
    },
  },

  -- More precise rename function for TypeScript - Fixed config with proper opts
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup({
        -- Default configuration
        cmd_name = "IncRename",
        hl_group = "Substitute",
        preview_empty_name = false,
        show_message = true,
        input_buffer_type = nil,
        post_hook = nil,
      })
    end,
  },
}
