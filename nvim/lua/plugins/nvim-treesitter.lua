return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-context" },
    -- opts are now passed into treesitter config properly, so manual highlight 
    -- might not be needed anymore.
    keys = {
        { "<leader>rr", "<cmd>TSEnable highlight<cr>" }
    },
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
