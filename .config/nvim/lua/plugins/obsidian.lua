local uv = vim.loop

return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = false,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "wiki",
          path = "/Users/shivayanbora/PKM/My-Wiki-Vault",
        },
      },
      attachments = {
        img_folder = "assets",
        img_name_func = function()
          return string.format("Pasted image %s", os.date("%Y%m%d%H%M%S"))
        end,
        -- This function controls how the pasted image is referenced in the note
        img_text_func = function(_, path_obj)
          -- Convert a table-like path object to a string.
          local str_path = tostring(path_obj)
          local filename = vim.fs.basename(str_path)
          return string.format("![[%s]]", filename)
        end,
      },
      new_notes_location = "notes_subdir",
      notes_subdir = "00_inbox",
      note_frontmatter_func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
          note:add_alias(note.title)
        end

        local out = {
          id = note.id,
          aliases = note.aliases,
          tags = note.tags or {},
        }

        -- Convert the Path object to a string:
        if uv.fs_stat(tostring(note.path)) == nil then
          table.insert(out.tags, "todo")
        end

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

      -- Optional, customize how note file names are generated given the ID, target directory, and title.
      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
        -- This is equivalent to the default behavior.
        local path = spec.dir / tostring(spec.id)
        return path:with_suffix(".md")
      end,
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M:%S",
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      ui = {
        enable = false,
      },
      use_advanced_formatting = true,
      disable_frontmatter = false,
      follow_url_func = function(url)
        -- Allow other plugins to handle URLs/formatting
        vim.cmd("normal! gx")
      end,
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      -- Create an autocmd for Obsidian notes
      vim.api.nvim_create_autocmd("BufNewFile", {
        pattern = "*.md",
        callback = function()
          vim.opt_local.modifiable = true
        end,
      })

      -- Fix LaTeX rendering in markdown files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          -- Set maximum concealment level for LaTeX
          vim.opt_local.conceallevel = 3
          vim.opt_local.concealcursor = "nvic"

          -- Conceal LaTeX delimiters and content
          vim.cmd([[syntax match markdownMathDelimiter /\$\$/ conceal]])
          vim.cmd([[syntax match markdownMathDelimiter /\$/ conceal]])
        end,
      })

      -- Fix tag formatting issues with #tag/subtag pattern
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.md",
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
          local modified = false

          for i, line in ipairs(lines) do
            -- Check for incorrectly formatted tags and fix them
            if line:match("^# %S+/%S+") then
              local fixed_line = line:gsub("^# ", "#")
              vim.api.nvim_buf_set_lines(bufnr, i - 1, i, false, { fixed_line })
              modified = true
            end
          end

          if modified then
            -- No explicit save needed as BufWritePre happens before save
          end
        end,
      })

      -- Disable the default markdown styling
      vim.g.markdown_recommended_style = 0

      vim.keymap.set("n", "<leader>zi", "<Cmd>ObsidianPasteImg<CR>", {
        desc = "Paste image from clipboard in obsidian.nvim",
      })
    end,
  },

  -- Add Mason configuration to install markdownlint
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "markdownlint")
    end,
  },

  -- Configure the linter to disable unwanted warnings
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = { "markdownlint" }

      opts.linters = opts.linters or {}
      opts.linters.markdownlint = {
        args = {
          "--disable",
          "MD013", -- Line length limit
          "--disable",
          "MD033", -- Inline HTML
          "--disable",
          "MD041", -- First line heading
          "--disable",
          "MD022", -- Headers must be surrounded by blank lines
          "--disable",
          "MD023", -- Headers must start at beginning of line
        },
      }
    end,
  },

  -- Configure the formatter to skip markdown files
  {
    -- "stevearc/conform.nvim",
    -- opts = function(_, opts)
    --   opts.formatters_by_ft = opts.formatters_by_ft or {}
    --   opts.formatters_by_ft.markdown = {}
    -- end,
  },
}
