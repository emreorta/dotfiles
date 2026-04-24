return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = os.getenv("OBSIDIAN_VAULT_NAME"),
        path = os.getenv("OBSIDIAN_VAULT_PATH"),
      },
    },
  },
}
