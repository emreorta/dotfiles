return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-context" },
  branch = "master",
  main = "nvim-treesitter.configs",
  opts = {
    auto_install = { enable = true },
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query"
    },
  },
}
