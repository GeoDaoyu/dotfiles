return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
                ████ ██████           █████      ██                    
              ███████████             █████                            
              █████████ ███████████████████ ███   ███████████  
              █████████  ███    █████████████ █████ ██████████████  
            █████████ ██████████ █████████ █████ █████ ████ █████  
          ███████████ ███    ███ █████████ █████ █████ ████ █████ 
          ██████  █████████████████████ ████ █████ █████ ████ ██████
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
        },
      },
    },
  },
}
