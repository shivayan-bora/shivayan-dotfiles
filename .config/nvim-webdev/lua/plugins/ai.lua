-- Create file: ~/.config/nvim/lua/plugins/ai.lua
return {
  -- Optimize Codeium for a better cursor-like experience
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        enable_chat = true,
        language_server = {
          restart_on_error = true,
        },
        bin_path = vim.fn.stdpath("data") .. "/codeium/bin",
        api = {
          completion = {
            enable_line_suggestion = true, -- Enable multiline completion
            enable_gem_suggestion = true, -- Enable new gem-style completions
          },
        },
        tools = {
          prompt_template_file = vim.fn.stdpath("config") .. "/lua/codeium/templates.lua",
          language_autoselect = true,
        },
      })
    end,
  },

  -- Ensure autocompletion works well with AI suggestions
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "Exafunction/codeium.nvim",
    },
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Add Codeium as a source with high priority
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })

      -- Improve UX with ghost text
      opts.experimental = vim.tbl_deep_extend("force", opts.experimental or {}, {
        ghost_text = true,
      })

      -- Optimize completion behavior
      opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
        completeopt = "menu,menuone,noinsert",
      })

      return opts
    end,
  },
}
