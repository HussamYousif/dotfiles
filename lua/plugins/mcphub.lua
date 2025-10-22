return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  config = function()
    require("mcphub").setup({
      --- `mcp-hub` binary related options ---
      config = vim.fn.expand("~/.config/mcphub/servers.json"), -- Absolute path to MCP Servers config file
      port = 37373, -- The port `mcp-hub` server listens to
      shutdown_delay = 5 * 60 * 1000, -- Delay in ms before shutting down the server when last instance closes (5 minutes)
      use_bundled_binary = false, -- Use global `mcp-hub` binary
      mcp_request_timeout = 60000, -- Max time for MCP tool/resource execution (1 minute)

      --- Environment variables for all MCP servers ---
      global_env = {
        -- Add any global environment variables here
        -- Example: "GITHUB_TOKEN", -- Will use value from os.getenv
      },

      --- Workspace configuration ---
      workspace = {
        enabled = true, -- Enable project-local configuration files
        look_for = { ".mcphub/servers.json", ".vscode/mcp.json", ".cursor/mcp.json" },
        reload_on_dir_changed = true, -- Auto-switch hubs on directory change
        port_range = { min = 40000, max = 41000 }, -- Port range for workspace hubs
      },

      --- Chat-plugin related options ---
      auto_approve = false, -- Require confirmation for MCP tool calls
      auto_toggle_mcp_servers = true, -- Let LLMs start/stop MCP servers as needed

      --- CopilotChat Integration ---
      extensions = {
        copilotchat = {
          enabled = true, -- Enable CopilotChat integration
          convert_tools_to_functions = true, -- Convert MCP tools to CopilotChat functions
          convert_resources_to_functions = true, -- Convert MCP resources to CopilotChat functions
          add_mcp_prefix = false, -- Don't add "mcp_" prefix to function names
        },
      },

      --- UI configuration ---
      ui = {
        window = {
          width = 0.85,
          height = 0.85,
          align = "center",
          border = "rounded",
          relative = "editor",
          zindex = 50,
        },
        wo = {
          winhl = "Normal:MCPHubNormal,FloatBorder:MCPHubBorder",
        },
      },

      --- Logging configuration ---
      log = {
        level = vim.log.levels.WARN,
        to_file = false,
        prefix = "MCPHub",
      },

      --- Callbacks ---
      on_ready = function(hub)
        vim.notify("MCPHub is ready!", vim.log.levels.INFO)
      end,
      on_error = function(err)
        vim.notify("MCPHub error: " .. err, vim.log.levels.ERROR)
      end,
    })
  end,
  keys = {
    { "<leader>m", nil, desc = "🔌 MCP Hub" },
    { "<leader>mm", "<cmd>MCPHub<cr>", desc = "Open MCP Hub" },
    { "<leader>mr", "<cmd>MCPRestart<cr>", desc = "Restart MCP Hub" },
    { "<leader>ms", "<cmd>MCPStop<cr>", desc = "Stop MCP Hub" },
    { "<leader>ml", "<cmd>MCPLog<cr>", desc = "Show MCP Log" },
    { "<leader>mc", "<cmd>MCPConfigEdit<cr>", desc = "Edit MCP Config" },
    { "<leader>mh", "<cmd>MCPHubs<cr>", desc = "List Active Hubs" },
  },
  cmd = {
    "MCPHub",
    "MCPRestart",
    "MCPStop",
    "MCPLog",
    "MCPConfigEdit",
    "MCPHubs",
  },
}