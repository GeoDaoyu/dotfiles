return {
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
    end,
  },
  {
    "blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
      },
      snippets = {
        preset = "luasnip",
      },
      completion = {
        documentation = {
          auto_show = false,
        },
      },
      sources = {
        providers = {
          snippets = {
            max_items = 5,
            score_offset = 100,
          },
          lsp = {
            score_offset = 90,
            transform_items = function(_, items)
              return vim.tbl_filter(function(item)
                return item.kind == require("blink.cmp.types").CompletionItemKind.Method
                  or item.kind == require("blink.cmp.types").CompletionItemKind.Field
              end, items)
            end,
          },
          buffer = {
            max_items = 3,
            score_offset = 80,
          },
          path = {
            max_items = 3,
            score_offset = 70,
          },
        },
      },
    },
  },
}
