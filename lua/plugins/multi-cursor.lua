return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  keys = {
    { "<leader>hm", "<Plug>(VM-Select-All)", mode = { "n", "v" }, desc = "Add cursor" },
    { "<leader>ha", "<Plug>(VM-Add-Cursor-Up)", desc = "Add cursor up" },
    { "<leader>hs", "<Plug>(VM-Add-Cursor-Down)", desc = "Add cursor down" },
    { "<leader>ht", "<Plug>(VM-Toggle-Mappings)", desc = "Toggle VM mappings" },
    { "<leader>hq", "<Plug>(VM-Quit)", desc = "Quit VM" },
  },
  config = function()
    vim.g.VM_theme = "purplegray"
    vim.g.VM_Mono_hl = "DiffText"
    vim.g.VM_Cursor_hl = "Cursor"
    vim.g.VM_Insert_hl = "DiffAdd"
  end,
}
