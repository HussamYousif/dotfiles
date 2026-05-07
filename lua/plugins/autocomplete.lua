return {
  { "hrsh7th/nvim-cmp", enabled = false },
  {
    "saghen/blink.cmp",
    enabled = true,
    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
        end,
      },
    },
    opts = function(_, opts)
      opts.snippets = { preset = "luasnip" }
      opts.keymap = {
        preset = "default",
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<S-Tab>"] = { "fallback" },
      }
      opts.completion = {
        menu = {
          draw = {
            components = {
              label_detail = { text = function() return "" end },
            },
          },
        },
      }
      opts.sources = {
        default = { "lsp" },
      }
      return opts
    end,
  },
  { "rafamadriz/friendly-snippets", enabled = true },
  { "nvim-mini/mini.snippets", enabled = false },
}
