return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "Myzel394/jsonfly.nvim", lazy = true }
  },
  config = function()
    require("telescope").setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
          "--ignore-file",
          ".gitignore",
          "--hidden",
          "--glob=!.git/*"
        }
      }
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff",
      function()
        builtin.find_files({ hidden = true })
      end, {})

    vim.keymap.set("n", "<leader>fp",
      function()
        builtin.git_files({ show_untracked = true })
      end, {})

    vim.keymap.set("n", "<leader>fws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)

    vim.keymap.set("n", "<leader>fWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)

    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)

    vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>j", "<cmd>Telescope jsonfly<CR>", {})
  end
}
