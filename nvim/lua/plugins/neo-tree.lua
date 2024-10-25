return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v2.x",
  keys = {
    { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "MunifTanjim/nui.nvim",  lazy = true },
  },
  opts = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = "open_current",
    },
  },
}
