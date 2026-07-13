return {
  {
    "aktersnurra/no-clown-fiesta.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local palettes = require("no-clown-fiesta.palettes")
      -- softens the default white fg a bit
      palettes.get("dark").fg = "#CFCFCF"
    end,
  },
}
