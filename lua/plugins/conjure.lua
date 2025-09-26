return {
  {
    "Olical/conjure",
    ft = { "clojure", "clojurescript", "fennel", "scheme" },
    config = function()
      -- Configure Conjure for optimal Clojure development
      vim.g["conjure#mapping#doc_word"] = "K"
      vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil
      vim.g["conjure#log#hud#enabled"] = true
      vim.g["conjure#log#hud#passive_close_delay"] = 0
      vim.g["conjure#log#botright"] = true
      
      -- Enhanced mappings for better workflow
      vim.g["conjure#mapping#prefix"] = "<localleader>"
      
      -- ClojureScript specific configurations
      vim.g["conjure#client#clojure#nrepl#eval#print_function"] = "cljs.repl/print"
      vim.g["conjure#client#clojure#nrepl#eval#print_quota"] = 1024
      
      -- Better evaluation result formatting
      vim.g["conjure#eval#result#fold#enabled"] = true
      vim.g["conjure#eval#result#fold#lines"] = 10
      
      -- Load your custom keymaps
      require("config.keymaps-clojure").setup()
    end,
  },
}