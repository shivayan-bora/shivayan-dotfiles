return {
  "MeanderingProgrammer/render-markdown.nvim",
  lazy = false,
  version = "*",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons", "epwalsh/obsidian.nvim" },
  config = function()
    require("render-markdown").setup({
      code = {
        sign = true,
        style = "full",
      },
      checkbox = {
        checked = { scope_highlight = "@markup.strikethrough" },
      },
      html = {
        -- Turn on / off all HTML rendering
        enabled = true,
        -- Additional modes to render HTML
        render_modes = false,
        comment = {
          -- Turn on / off HTML comment concealing
          conceal = false,
          -- Optional text to inline before the concealed comment
          text = nil,
          -- Highlight for the inlined text
          highlight = "RenderMarkdownHtmlComment",
        },
      },
      latex = {
        enabled = true,
        highlight = "RenderMarkdownMath",
      },
    })
  end,
}
