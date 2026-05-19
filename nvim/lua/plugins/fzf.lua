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
          ["<M-p>"] = "toggle-preview",
          ["<C-s>"] = "preview-page-down",
          ["<C-a>"] = "preview-page-up",
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
