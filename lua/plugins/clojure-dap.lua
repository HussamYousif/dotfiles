return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    ft = { "clojure" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Adapter: requires the VS Code Clojure Debug adapter
      -- Install once: npm i -g @badsyntax/vscode-clojure-debug
      -- This exposes the `clojure-debug` binary on PATH
      dap.adapters.clojure = {
        type = "executable",
        command = "clojure-debug",
        args = { "adapter" },
        enrich_config = function(config, on_config)
          -- Default to localhost if not provided
          config.connect = config.connect or {}
          config.connect.host = config.connect.host or "127.0.0.1"
          on_config(config)
        end,
      }

      -- Useful defaults for common Clojure workflows
      dap.configurations.clojure = {
        -- Connect to an existing nREPL (start it via your tool first)
        {
          type = "clojure",
          request = "launch",
          name = "Connect nREPL (prompt for port)",
          program = "",
          connect = function()
            local input = vim.fn.input("nREPL port: ")
            local port = tonumber(input)
            return { host = "127.0.0.1", port = port }
          end,
        },
        -- Leiningen project (assumes cider-nrepl middleware available)
        {
          type = "clojure",
          request = "launch",
          name = "Lein: Run and Debug",
          build = "lein",
          -- You can override the command if needed, default is `lein repl :headless`
          -- leinCmd = "lein repl :headless",
        },
        -- deps.edn (clj) project
        {
          type = "clojure",
          request = "launch",
          name = "clj(deps.edn): Run and Debug",
          build = "clj",
          -- cljCmd = "clj -M:nrepl",
        },
        -- shadow-cljs (ClojureScript)
        {
          type = "clojure",
          request = "launch",
          name = "shadow-cljs: Debug app",
          build = "shadow-cljs",
          -- task = "app",
        },
      }

      -- UI
      dapui.setup({})
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps (buffer-local for clojure)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "clojure",
        callback = function()
          local opts = { buffer = true, silent = true }
          -- Core controls under <leader>D
          vim.keymap.set("n", "<leader>Db", dap.toggle_breakpoint, vim.tbl_extend("force", opts, { desc = "Toggle breakpoint" }))
          vim.keymap.set("n", "<leader>DB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
          end, vim.tbl_extend("force", opts, { desc = "Conditional breakpoint" }))
          vim.keymap.set("n", "<leader>Dc", dap.continue, vim.tbl_extend("force", opts, { desc = "Continue/Start" }))
          vim.keymap.set("n", "<leader>Do", dap.step_over, vim.tbl_extend("force", opts, { desc = "Step over" }))
          vim.keymap.set("n", "<leader>Di", dap.step_into, vim.tbl_extend("force", opts, { desc = "Step into" }))
          vim.keymap.set("n", "<leader>DO", dap.step_out, vim.tbl_extend("force", opts, { desc = "Step out" }))
          vim.keymap.set("n", "<leader>Dr", dap.restart, vim.tbl_extend("force", opts, { desc = "Restart" }))
          vim.keymap.set("n", "<leader>Dq", dap.terminate, vim.tbl_extend("force", opts, { desc = "Terminate" }))

          -- UI
          vim.keymap.set("n", "<leader>Du", dapui.toggle, vim.tbl_extend("force", opts, { desc = "DAP UI toggle" }))
          vim.keymap.set("n", "<leader>De", function()
            vim.ui.input({ prompt = "Eval (in debug context): " }, function(expr)
              if expr and #expr > 0 then
                dapui.eval(expr)
              end
            end)
          end, vim.tbl_extend("force", opts, { desc = "DAP Eval" }))
        end,
      })
    end,
  },
}

