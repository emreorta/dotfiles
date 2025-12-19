return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>gl", function() vim.cmd.Git("log") end)
    vim.keymap.set("n", "<leader>gw", vim.cmd.Gwrite)
    vim.keymap.set("n", "<leader>gpl", function() vim.cmd.Git("pull") end)
    vim.keymap.set("n", "<leader>gpsf", function() vim.cmd.Git("push --force-with-lease") end)
  end
}
