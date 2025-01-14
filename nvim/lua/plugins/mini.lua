return {
  { "echasnovski/mini.ai",      version = false, opts = {} },
  { "echasnovski/mini.comment", version = false, opts = {} },
  {
    "echasnovski/mini.files",
    version = false,
    opts = {},
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
      {
        "<leader>fc",
        function()
          ---@diagnostic disable-next-line: undefined-field
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
  },
}
