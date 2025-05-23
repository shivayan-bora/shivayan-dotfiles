return {
  --   -- Configure Mason to install markdownlint
  --   {
  --     "williamboman/mason.nvim",
  --     opts = function(_, opts)
  --       opts.ensure_installed = opts.ensure_installed or {}
  --       table.insert(opts.ensure_installed, "markdownlint")
  --     end,
  --   },
  --
  --   -- Configure linting behavior for markdown
  --   {
  --     "mfussenegger/nvim-lint",
  --     opts = function(_, opts)
  --       -- Set up linters by filetype
  --       opts.linters_by_ft = opts.linters_by_ft or {}
  --       opts.linters_by_ft.markdown = { "markdownlint" }
  --
  --       -- Configure markdownlint
  --       opts.linters = opts.linters or {}
  --       opts.linters.markdownlint = {
  --         args = {
  --           "--disable",
  --           "MD013", -- Line length
  --           "--disable",
  --           "MD033", -- Inline HTML
  --           "--disable",
  --           "MD041", -- First line heading
  --           "--disable",
  --           "MD022", -- Headers must be surrounded by blank lines
  --           "--disable",
  --           "MD023", -- Headers must start at beginning of line
  --         },
  --       }
  --     end,
  --   },
  --
  --   -- Configure formatting behavior for markdown
  --   {
  --     "stevearc/conform.nvim",
  --     opts = function(_, opts)
  --       -- Ensure formatters_by_ft exists
  --       opts.formatters_by_ft = opts.formatters_by_ft or {}
  --       -- Set empty formatters list for markdown to disable formatting
  --       opts.formatters_by_ft.markdown = {}
  --     end,
  --   },
}
