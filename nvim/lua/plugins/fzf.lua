return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local fzf = require("fzf-lua")

    local base_fd_opts = "--color=never --type f --strip-cwd-prefix --hidden --exclude .git"
    fzf.setup({
      files = {
        fd_opts = base_fd_opts,
      },

      grep = {
        rg_opts = "--column --line-number --no-heading --color=never --smart-case --hidden --glob=!.git/* --trim",
      },

      keymap = {
        builtin = {
          ["<F1>"] = "toggle-help",
          ["<F2>"] = "toggle-fullscreen",
          ["<F3>"] = "toggle-preview-wrap",
          ["<F4>"] = "toggle-preview",
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
          ["<S-left>"] = "preview-page-reset",
        },
        fzf = {
          ["ctrl-z"] = "abort",
          ["ctrl-f"] = "half-page-down",
          ["ctrl-b"] = "half-page-up",
          ["ctrl-a"] = "beginning-of-line",
          ["ctrl-e"] = "end-of-line",
          ["f3"] = "toggle-preview-wrap",
          ["f4"] = "toggle-preview",
          ["ctrl-d"] = "preview-page-down",
          ["ctrl-u"] = "preview-page-up",
          ["ctrl-q"] = "select-all+accept",
        },
      },
    })

    vim.keymap.set("n", "<leader>ff", function()
      fzf.files()
    end)

    vim.keymap.set("n", "<leader>fp", function()
      fzf.git_files()
    end)

    vim.keymap.set("n", "<leader>fa", function()
      fzf.files({
        fd_opts = base_fd_opts .. " --no-ignore",
      })
    end)

    vim.keymap.set("n", "<leader>fg", function()
      fzf.live_grep()
    end)

    vim.keymap.set("n", "<leader>fws", function()
      fzf.grep_cword()
    end)

    vim.keymap.set("n", "<leader>fWs", function()
      fzf.grep_cWORD()
    end)

    vim.keymap.set("n", "<leader>fh", function()
      fzf.help_tags()
    end)
  end,
}
