return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local startify = require("alpha.themes.startify")
      local logo = [[

                       _
       ___ ___ ___ _ _|_|_____
      |   | -_| . | | | |     |
      |_|_|___|___|\_/|_|_|_|_|
      ]]

      startify.section.header.val = vim.split(logo, "\n")
      alpha.setup(startify.config)
    end
  }
}
