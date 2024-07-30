return {
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                cmp.confirm()
              end
            else
              fallback()
            end
          end, { "i" }),
          -- end, { "i", "s", "c" }),
        },
      })
    end,
  },
}
