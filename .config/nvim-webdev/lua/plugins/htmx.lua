-- Create file: ~/.config/nvim/lua/plugins/htmx.lua
return {
  -- Add HTMX support
  {
    "windwp/nvim-ts-autotag",
    opts = function(_, opts)
      opts = opts or {}
      opts.filetypes = vim.list_extend(opts.filetypes or {}, { "html", "htm" })
      return opts
    end,
  },

  -- Add HTMX snippet support
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Add custom HTMX snippets
      require("luasnip").add_snippets("html", {
        require("luasnip").snippet({ trig = "hget", name = "HTMX GET", dscr = "HTMX GET request" }, {
          require("luasnip").text_node('hx-get="'),
          require("luasnip").insert_node(1, "url"),
          require("luasnip").text_node('" hx-trigger="'),
          require("luasnip").insert_node(2, "event"),
          require("luasnip").text_node('" hx-target="'),
          require("luasnip").insert_node(3, "#target"),
          require("luasnip").text_node('"'),
        }),
        require("luasnip").snippet({ trig = "hpost", name = "HTMX POST", dscr = "HTMX POST request" }, {
          require("luasnip").text_node('hx-post="'),
          require("luasnip").insert_node(1, "url"),
          require("luasnip").text_node('" hx-trigger="'),
          require("luasnip").insert_node(2, "event"),
          require("luasnip").text_node('" hx-target="'),
          require("luasnip").insert_node(3, "#target"),
          require("luasnip").text_node('"'),
        }),
      })
    end,
  },
}
