return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  config = function()
    vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end)
    vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end)
    vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
    vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end)
    vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
    vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end)
    vim.keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end)

    -- choose a refactor in Telescope
    require("telescope").load_extension("refactoring")
    vim.keymap.set(
      { "n", "x" },
      "<leader>rr",
      function() require('telescope').extensions.refactoring.refactors() end
    )
  end
}
