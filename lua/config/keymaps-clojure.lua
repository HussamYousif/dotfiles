local M = {}

M.setup = function()
  -- Setup specific Clojure REPL workspace
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "clojure",
    callback = function()
      -- Project/REPL management
      vim.keymap.set("n", "<leader>rp", "<cmd>ConjureConnect<CR>", { desc = "Connect to REPL" })
      vim.keymap.set("n", "<leader>rr", "<cmd>ConjureLogResetSoft<CR>", { desc = "Reset REPL log" })
      vim.keymap.set("n", "<leader>rl", "<cmd>ConjureLogToggle<CR>", { desc = "Toggle REPL log" })
      vim.keymap.set("n", "<leader>ri", "<cmd>ConjureLogVSplit<CR>", { desc = "Open REPL log in vsplit" })

      -- Namespace management
      vim.keymap.set("n", "<leader>nn", "<cmd>ConjureEvalNs<CR>", { desc = "Evaluate namespace" })
      vim.keymap.set("n", "<leader>nr", "<cmd>ConjureRefreshNs<CR>", { desc = "Refresh namespace" })

      -- Evaluation with result display
      vim.keymap.set("n", "<leader>ee", "<cmd>ConjureEvalCurrentForm<CR>", { desc = "Evaluate current form" })
      vim.keymap.set("v", "<leader>ee", "<cmd>ConjureEvalVisual<CR>", { desc = "Evaluate visual selection" })
      vim.keymap.set("n", "<leader>eE", "<cmd>ConjureEvalCommentCurrentForm<CR>", { desc = "Eval with comment" })

      -- REPL interaction
      vim.keymap.set("n", "<leader>rb", function()
        -- Open a REPL interaction buffer
        vim.cmd("split")
        vim.cmd("wincmd j")
        vim.cmd("resize 10")
        vim.cmd("enew")
        vim.cmd("setlocal buftype=nofile")
        vim.cmd("setlocal filetype=clojure")
        vim.cmd("nnoremap <buffer> <CR> :ConjureEvalCurrentForm<CR>")
        vim.notify("REPL interaction buffer created. Press Enter to evaluate.", vim.log.levels.INFO)
      end, { desc = "Open REPL interaction buffer" })

      -- Portal data viewer integration
      vim.keymap.set("n", "<leader>pv", "<cmd>Portal<CR>", { desc = "Start Portal viewer" })
      vim.keymap.set("n", "<leader>pc", "<cmd>PortalClear<CR>", { desc = "Clear Portal viewer" })
      vim.keymap.set("n", "<leader>pt", function()
        -- Send current form to Portal viewer
        vim.cmd([[ConjureEval (tap> (do ]] .. vim.fn.input("Clojure form to tap>: ") .. [[))]])
      end, { desc = "Tap> expression to Portal" })
      
      -- Quick documentation and source viewing
      vim.keymap.set("n", "<leader>dd", function()
        local word = vim.fn.expand("<cword>")
        vim.cmd("ConjureEval (clojure.repl/doc " .. word .. ")")
      end, { desc = "Show documentation" })
      
      vim.keymap.set("n", "<leader>ds", function()
        local word = vim.fn.expand("<cword>")
        vim.cmd("ConjureEval (clojure.repl/source " .. word .. ")")
      end, { desc = "Show source" })
      
      -- Macroexpansion shortcuts
      vim.keymap.set("n", "<leader>mm", "<cmd>ConjureEvalCommentCurrentForm<CR>:s/;.*//<CR>:noh<CR>A(macroexpand '<Esc>A)<CR><cmd>ConjureEvalCurrentForm<CR>", { desc = "Macroexpand-1" })
      vim.keymap.set("n", "<leader>mM", "<cmd>ConjureEvalCommentCurrentForm<CR>:s/;.*//<CR>:noh<CR>A(macroexpand-all '<Esc>A)<CR><cmd>ConjureEvalCurrentForm<CR>", { desc = "Macroexpand-all" })
      
      -- Quick REPL shortcuts
      vim.keymap.set("n", "<leader>rh", function()
        vim.cmd("ConjureEval (println \"\\n=== REPL Help ===\\n(doc symbol) - Show documentation\\n(source symbol) - Show source\\n(require '[ns :reload-all]) - Reload namespace\\n(clojure.test/run-tests) - Run tests\\n(tap> value) - Send to Portal\\n\")")
      end, { desc = "REPL help" })
    end,
  })
end

return M
