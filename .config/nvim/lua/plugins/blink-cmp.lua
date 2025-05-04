return {
  -- {
  --   "saghen/blink.compat",
  --   branch = "main",
  --   version = "*",
  -- },
  {
    "saghen/blink.cmp",
    dependencies = {
      { "saghen/blink.compat", lazy = true, version = false },
    },
    opts_extend = { "sources.default" },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        min_keyword_length = function(ctx)
          return ctx.trigger.kind == "trigger_character" and 0 or 3
        end,
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "obsidian",
          "obsidian_new",
          "obsidian_tags",
        },
        compat = { "obsidian", "obsidian_new", "obsidian_tags" },
        providers = {
          obsidian = {
            name = "obsidian",
            module = "blink.compat.source",
          },
          obsidian_new = {
            name = "obsidian_new",
            module = "blink.compat.source",
          },
          obsidian_tags = {
            name = "obsidian_tags",
            module = "blink.compat.source",
          },
        },
      },
      snippets = {
        expand = function(snippet, _)
          return LazyVim.cmp.expand(snippet)
        end,
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          update_delay_ms = 60,
          window = {
            max_width = math.min(80, vim.o.columns),
            border = "rounded",
          },
        },
      },
    },
  },
}
