return {
  "echasnovski/mini.files",
  version = "*",
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
  }
}
