return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo" },
  keys = {
    { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },
    { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Task info" },
    { "<leader>oc", "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
  },
  opts = {
    templates = {
      "builtin",
      "user.clojure_bb",
    },
    strategy = {
      "toggleterm",
      direction = "horizontal",
      size = 15,
      quit_on_exit = "never",
      open_on_start = false,
    },
    component_aliases = {
      default = {
        { "display_duration", detail_level = 2 },
        "on_output_summarize",
        "on_exit_set_status",
        "on_complete_notify",
        "on_complete_dispose",
      },
    },
  },
  config = function(_, opts)
    local overseer = require("overseer")
    overseer.setup(opts)

    -- Custom Babashka task template
    overseer.register_template({
      name = "clojure_bb",
      builder = function()
        return {
          name = "bb",
          builder = function(params)
            return {
              cmd = { "bb" },
              args = vim.list_extend({ "run" }, params.args or {}),
              components = { "default" },
            }
          end,
          params = {
            args = {
              type = "list",
              delimiter = " ",
              default = {},
            },
          },
        }
      end,
      condition = {
        filetype = { "clojure", "clojurescript", "edn" },
        callback = function()
          return vim.fn.filereadable("bb.edn") == 1
        end,
      },
    })

    -- Pre-configured babashka tasks from your workflow
    local bb_tasks = {
      { name = "tests-backend", desc = "Run backend tests" },
      { name = "tests-frontend", desc = "Run frontend tests" },
      { name = "cljfmt fix", desc = "Fix Clojure formatting" },
      { name = "cljfmt check", desc = "Check Clojure formatting" },
      { name = "lint", desc = "Run linter" },
    }

    for _, task in ipairs(bb_tasks) do
      overseer.register_template({
        name = "bb " .. task.name,
        builder = function()
          return {
            name = task.desc,
            cmd = { "bb", "run", task.name },
            components = { "default" },
          }
        end,
        condition = {
          filetype = { "clojure", "clojurescript", "edn" },
          callback = function()
            return vim.fn.filereadable("bb.edn") == 1
          end,
        },
      })
    end

    -- Quick test runner for current namespace
    overseer.register_template({
      name = "clojure_test_ns",
      builder = function()
        return {
          name = "Test current namespace",
          cmd = { "bb", "run", "test-ns" },
          args = function()
            local ns = require("conjure.client.clojure.nrepl.parse").get_ns_name()
            return ns and { ns } or {}
          end,
          components = { "default" },
          condition = {
            callback = function()
              return vim.bo.filetype == "clojure" and string.match(vim.fn.expand("%:p"), "test")
            end,
          },
        }
      end,
    })
  end,
}