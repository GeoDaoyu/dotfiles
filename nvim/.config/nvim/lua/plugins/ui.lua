return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        config = function(opts, _)
          opts.preset.header = [[
      ████ ██████           █████      ██                    
    ███████████             █████                            
    █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
  █████████ ██████████ █████████ █████ █████ ████ █████  
███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
          ]]
        end,
      },
      image = {},
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
              local path = node:get_id()
              local cwd = vim.fn.getcwd()
              local relative_path = path:gsub("^" .. vim.pesc(cwd) .. "/", "")
              vim.fn.setreg("+", relative_path, "c")
            end,
            desc = "Copy Relative Path to Clipboard",
          },
        },
      },
    },
  },
}
