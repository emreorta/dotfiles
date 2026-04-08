return {
  -- can't use opts with these
  { "tpope/vim-repeat" },
  { "mbbill/undotree" },

  { "m-demare/hlargs.nvim", opts = {} },
  { "petertriho/nvim-scrollbar", opts = {} },
  { "meznaric/key-analyzer.nvim", opts = {} },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {},
  },
  {
    "shortcuts/no-neck-pain.nvim",
    opts = {
      mappings = {
        enabled = true,
        toggleLeftSide = "<leader>nvl",
        toggleRightSide = "<leader>nvr",
      },
      width = 125
    }
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        override_vim_notify = true,
      }
    }
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
