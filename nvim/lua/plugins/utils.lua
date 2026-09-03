return {
  -- can't use opts with these
  { "tpope/vim-repeat" },

  { "XXiaoA/atone.nvim", cmd = "Atone", opts = {} },
  { "m-demare/hlargs.nvim", opts = {} },
  { "petertriho/nvim-scrollbar", opts = {} },
  { "meznaric/key-analyzer.nvim", opts = {} },
  { "nvim-tree/nvim-web-devicons", opts = {} },
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
      width = 125,
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        override_vim_notify = true,
      },
    },
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
    keys = vim.env.TMUX and {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    } or {
      { "<C-h>", "<C-w>h" },
      { "<C-j>", "<C-w>j" },
      { "<C-k>", "<C-w>k" },
      { "<C-l>", "<C-w>l" },
      { "<C-\\>", "<C-w>p" },
    },
  },
  {
    "wom/wombient",
    opts = {
      enabled = false,
      stripe = {
        mode = "inline"
      }
    }
  },
}
