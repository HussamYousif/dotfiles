return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})

    -- v4 keymaps are now set via vim.keymap.set instead of setup()
    vim.keymap.set("i", "<C-s><C-s>", "<Plug>(nvim-surround-insert-line)")
    vim.keymap.set("n", "s", "<Plug>(nvim-surround-normal)")
    vim.keymap.set("n", "ss", "<Plug>(nvim-surround-normal-cur)")
    vim.keymap.set("n", "S", "<Plug>(nvim-surround-normal-line)")
    vim.keymap.set("n", "SS", "<Plug>(nvim-surround-normal-cur-line)")
    vim.keymap.set("x", "s", "<Plug>(nvim-surround-visual)")
    vim.keymap.set("x", "S", "<Plug>(nvim-surround-visual-line)")
    vim.keymap.set("n", "sd", "<Plug>(nvim-surround-delete)")
    vim.keymap.set("n", "sc", "<Plug>(nvim-surround-change)")
  end,
}
