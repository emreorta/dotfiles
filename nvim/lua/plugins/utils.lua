return {
  -- can't use opts with these
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-repeat" },
  { "mbbill/undotree" },

  { "m-demare/hlargs.nvim",          opts = {} },
  { "petertriho/nvim-scrollbar",     opts = {} },
  { "meznaric/key-analyzer.nvim",    opts = {} },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {}
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
  }
}
