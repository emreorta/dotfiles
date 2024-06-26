function SetColorscheme(color)
    color = color or os.getenv("NVIM_COLORSCHEME") or "nightfox"
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

            SetColorscheme()
        end
    },
    { "EdenEast/nightfox.nvim" },
    { "morhetz/gruvbox" },

    -- also not bad
    { "tomasiser/vim-code-dark" },
    { "sainnhe/everforest" },
}
