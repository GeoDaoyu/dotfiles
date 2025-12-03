return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        config = function(opts, _)
          -- util.project
          for i, key_item in ipairs(opts.preset.keys) do
            if key_item.key == "P" then
              opts.preset.keys[i].key = "p"
              break
            end
          end
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
