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
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
        end,
      },
    },
    opts = {
      snippets = { preset = "luasnip" },
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
      sources = {
        default = { "snippets", "lsp" },
        providers = {
          snippets = {
            score_offset = 100,
          },
        },
      },
    },
  },
  { "rafamadriz/friendly-snippets", enabled = true },
  { "nvim-mini/mini.snippets", enabled = false },
}
