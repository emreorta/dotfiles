function SetColorscheme(color)
  color = color or os.getenv("NVIM_COLORSCHEME") or "nightfox"
  vim.cmd.colorscheme(color)
end

return {
  {
    "tjdevries/colorbuddy.nvim",
  },

  -- alternatives
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        commentStyle = { italic = false },
        functionStyle = { italic = false },
        keywordStyle = { italic = false },
        transparent = false,
        terminalColors = true,
      })

      SetColorscheme()
    end
  },
  { "EdenEast/nightfox.nvim" },
  { "morhetz/gruvbox" },
  { "habamax/vim-gruvbit" },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
      }
      require('bamboo').load()
    end,
  },
  { "tomasiser/vim-code-dark" },
  { "sainnhe/everforest" },
}
