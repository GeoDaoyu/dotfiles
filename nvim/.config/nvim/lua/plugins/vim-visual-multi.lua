return {
  "mg979/vim-visual-multi",
  init = function()
    vim.g.VM_default_mapping = 0
    vim.g.VM_maps = {
      ["Find Under"] = "",
    }
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end,
  config = function()
    vim.keymap.set("n", "gb", "<Plug>(VM-Find-Under)")
  end,
}
