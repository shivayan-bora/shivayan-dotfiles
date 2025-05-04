return {
  -- Optimize TypeScript LSP for your tech stack
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- TypeScript configuration
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
              -- For large monorepos/projects
              tsserver = {
                maxTsServerMemory = 4096,
                useSyntaxServer = "auto",
              },
            },
          },
          -- Performance optimizations for monorepos
          init_options = {
            maxTsServerMemory = 4096,
            disableAutomaticTypingAcquisition = true,
            hostInfo = "neovim",
            preferences = {
              importModuleSpecifierPreference = "relative",
              includeCompletionsForImportStatements = true,
              includeCompletionsWithSnippetText = true,
            },
          },
        },
        -- For HTML/CSS
        tailwindcss = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
            "astro",
          },
          init_options = {
            userLanguages = {
              vue = "html-vue",
              svelte = "html-svelte",
              astro = "html-astro",
            },
          },
        },
        -- For Angular
        angularls = {
          root_dir = function(fname)
            -- Handle both Angular CLI projects and standalone components
            return require("lspconfig.util").root_pattern("angular.json", "project.json")(fname)
              or require("lspconfig.util").root_pattern("package.json")(fname)
          end,
        },
        -- For Astro
        astro = {
          -- Default configuration is good
        },
        -- For Svelte
        svelte = {
          -- Default configuration is good
        },
      },
      -- Shared setup for all servers
      setup = {
        -- Customize TypeScript server setup
        vtsls = function()
          -- Add a hook to disable certain features for large files
          require("lazyvim.util").lsp.on_attach(function(client, bufnr)
            local filename = vim.api.nvim_buf_get_name(bufnr)
            local filesize = vim.fn.getfsize(filename)

            -- Disable certain features for large files
            if filesize > vim.g.lsp_max_filesize then
              client.server_capabilities.semanticTokensProvider = nil
              if client.name == "vtsls" then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
              end
              vim.notify("Large file detected, some LSP features disabled", vim.log.levels.INFO)
            end
          end)
          return true -- Return true to use the default setup
        end,
      },
    },
  },
}
