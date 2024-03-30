function ColorMyPencils(color)
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)
end

return {
    {
        "tjdevries/colorbuddy.nvim",
    },
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

            ColorMyPencils()
        end
    },

    { "arcticicestudio/nord-vim" },
    { "tomasiser/vim-code-dark" },
    { "overcache/NeoSolarized" },
    { "ayu-theme/ayu-vim" },
    { "sainnhe/everforest" },
    { "rebelot/kanagawa.nvim" },
    { "catppuccin/nvim", name = "catppuccin" },
    { "folke/tokyonight.nvim" },
    { "morhetz/gruvbox" },
    {
        "loganswartz/sunburn.nvim",
        dependencies = { "loganswartz/polychrome.nvim" }
    },
}
