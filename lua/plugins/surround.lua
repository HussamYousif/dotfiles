return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        insert_line = "<C-s><C-s>", -- Surround entire line in insert
        normal = "s", -- Add surround in normal mode (instead of ysiw)
        normal_cur = "ss", -- Surround current line
        normal_line = "S", -- Surround current line (linewise)
        normal_cur_line = "SS", -- Surround entire line (linewise, current line)
        visual = "s", -- Surround selection in visual mode
        visual_line = "S", -- Surround visual line
        delete = "sd", -- Delete surround
        change = "sc", -- Change surround
      },
    })
  end,
}
