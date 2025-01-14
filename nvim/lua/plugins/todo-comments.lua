return {
  {
    "folke/todo-comments.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    event = "VimEnter",
    opts = { signs = true },
    lazy = true
  }
}
