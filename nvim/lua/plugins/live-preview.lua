return {
  "brianhuster/live-preview.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  config = function()
    vim.keymap.set("n", "<leader>ls", "<cmd>LivePreview start<CR>")
    vim.keymap.set("n", "<leader>lc", "<cmd>LivePreview close<CR>")
    vim.keymap.set("n", "<leader>lp", "<cmd>LivePreview pick<CR>")
  end,
}
