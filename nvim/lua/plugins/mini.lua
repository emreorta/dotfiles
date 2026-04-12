return {
  { "nvim-mini/mini.ai", version = false, opts = {} },
  { "nvim-mini/mini.comment", version = false, opts = {} },
  { "nvim-mini/mini.splitjoin", version = false, opts = {} },
  { "nvim-mini/mini.surround", version = false, opts = {} },
  {
    "nvim-mini/mini.files",
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
  {
    "nvim-mini/mini.hipatterns",
    version = false,
    opts = {},
    config = function()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          bug = { pattern = "%f[%w]()BUG()%f[%W]", group = "MiniHipatternsFixme" },
          warn = { pattern = "%f[%w]()WARN()%f[%W]", group = "MiniHipatternsHack" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
          info = { pattern = "%f[%w]()INFO()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
