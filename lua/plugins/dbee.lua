return {
  -- Dbee - Modern database client for Neovim
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup({
        sources = {
          require("dbee.sources").MemorySource:new({
            {
              name = "planitid LOCAL",
              type = "postgres",
              url = "postgres://planitid:planitid@localhost:6432/planitid?sslmode=disable",
            },
          }),
          -- Also load from file for persistent connections added via UI
          require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
        },
      })
    end,
    keys = {
      {
        "<leader>do",
        function()
          require("dbee").open()
        end,
        desc = "Open Dbee",
      },
      {
        "<leader>dc",
        function()
          require("dbee").close()
        end,
        desc = "Close Dbee",
      },
      {
        "<leader>dt",
        function()
          require("dbee").toggle()
        end,
        desc = "Toggle Dbee",
      },
    },
  },
  -- Register <leader>d as "database" in which-key
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>d", group = "database" },
      },
    },
  },
}
