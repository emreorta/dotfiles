return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    keys = {
      {
        "<leader>db",
        function() require("dap").toggle_breakpoint() end,
        desc = "Toggle Breakpoint"
      },

      {
        "<leader>dc",
        function() require("dap").continue() end,
        desc = "Continue"
      },

      {
        "<leader>dC",
        function() require("dap").run_to_cursor() end,
        desc = "Run to Cursor"
      },

      {
        "<leader>dso",
        function() require("dap").step_over() end,
        desc = "Step over"
      },

      {
        "<leader>dsi",
        function() require("dap").step_into() end,
        desc = "Step into"
      },

      {
        "<leader>dr",
        function() require("dap").repl.open() end,
        desc = "Launch REPL"
      },

      {
        "<leader>dT",
        function() require("dap").terminate() end,
        desc = "Terminate"
      },

    }
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {},
      automatic_installation = {},
      ensure_installed = {
        "bash",
        "lua",
        "python",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
  }
}
