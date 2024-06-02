return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-context" },
    keys = {
        { "<leader>rr", "<cmd>TSEnable highlight<cr>"}
    },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            "c",
            "json",
            "lua",
            "go",
            "python",
            "vim",
            "vimdoc",
            "yaml"
        },
    },
}
