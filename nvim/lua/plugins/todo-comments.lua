return {
  {
    "folke/todo-comments.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    lazy = true,
    event = "VimEnter",
    opts = {
      signs = true,
      highlight = {
        before = "fg",  -- the `--` part
        keyword = "fg", -- the `TODO` part
        after = "fg",   -- the part after TODO
      }
    },
    keys = {
      {
        "]t",
        function() require("todo-comments").jump_next() end,
        desc = "Next todo comment"
      },

      {
        "[t",
        function() require("todo-comments").jump_prev() end,
        desc = "Previous todo comment"
      },

      {
        "<leader>st",
        "<cmd>TodoTelescope keywords=TODO<cr>",
        desc = "Find all TODO"
      },

      {
        "<leader>si",
        "<cmd>TodoTelescope keywords=INFO,NOTE<cr>",
        desc = "Find all INFO/NOTE comments"
      },

      {
        "<leader>sf",
        "<cmd>TodoTelescope keywords=FIX,FIXME,BUG,ISSUE<cr>",
        desc = "Find all FIX/FIXME/BUG/ISSUE comments"
      },

      {
        "<leader>sw",
        "<cmd>TodoTelescope keywords=WARN,WARNING,HACK<cr>",
        desc = "Find all WARN/WARNING/HACK comments"
      },

      {
        "<leader>sp",
        "<cmd>TodoTelescope keywords=PERF,PERFORMANCE,OPTIM,OPTIMIZE<cr>",
        desc = "Find all PERF/PERFORMANCE/OPTIM/OPTIMIZE comments"
      },
    }
  }
}
