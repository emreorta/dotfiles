return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    keys = {
      {
        "<leader>mpt",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<CR>",
        desc = "Markdown Preview"
      }
    }
  }
}
