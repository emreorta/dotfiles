return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>gl", function() vim.cmd.Git("log") end)
    vim.keymap.set("n", "<leader>gw", vim.cmd.Gwrite)
    vim.keymap.set("n", "<leader>gp", function() vim.cmd.Git("pull") end)
  end
}
