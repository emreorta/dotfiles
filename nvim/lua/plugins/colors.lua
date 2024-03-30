function ColorMyPencils(color)
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)
end

return {
    {
        "tjdevries/colorbuddy.nvim",
    },
    -- favorites
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
    { "EdenEast/nightfox.nvim" },
    { "morhetz/gruvbox" },

    -- also not bad
    { "catppuccin/nvim",        name = "catppuccin" },
    { "tomasiser/vim-code-dark" },
    { "sainnhe/everforest" },
}
