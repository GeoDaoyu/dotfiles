return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
   _    _______    ______          __
  | |  / / ___/   / ____/___  ____/ /__
  | | / /\__ \   / /   / __ \/ __  / _ \
  | |/ /___/ /  / /___/ /_/ / /_/ /  __/
  |___//____/   \____/\____/\____/\___/
        ]],
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = { "filesystem" },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            ".git",
          },
        },
      },
      window = {
        mappings = {
          ["<Enter>"] = "rename",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local filename = vim.fn.fnamemodify(node:get_id(), ":t")
              vim.fn.setreg("+", filename, "c")
            end,
            desc = "Copy FileName to Clipboard",
          },
          ["O"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              os.execute('open -R "' .. path .. '"')
            end,
            desc = "Open in Finder",
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_x = {
        Snacks.profiler.status(),
        -- stylua: ignore
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = function() return { fg = Snacks.util.color("Statement") } end,
        },
        -- stylua: ignore
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = function() return { fg = Snacks.util.color("Constant") } end,
        },
        -- stylua: ignore
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = function() return { fg = Snacks.util.color("Special") } end,
        },
      }
      opts.sections.lualine_y = { "progress" }
      opts.sections.lualine_z = { "location" }
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          error = true,
          find = "vtsls",
        },
        opts = { skip = true },
      })
    end,
  },
}
