local utils = {}

function utils.buffer_previewer_maker(filepath, bufnr, opts)
  local previewers = require("telescope.previewers")
  local Job = require("plenary.job")

  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- just output BINARY in the preview instead
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  tag = "0.1.8",
  dependencies = {
    { "nvim-lua/plenary.nvim",                    lazy = true },
    { 'nvim-telescope/telescope-fzf-native.nvim', lazy = true, build = 'make' }
  },
  config = function()
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")

    require("telescope").setup({
      defaults = {
        buffer_previewer_maker = utils.buffer_previewer_maker,
        extensions = {
          fzf = {}
        },
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
            ["<C-s>"] = actions.cycle_previewers_next,
            ["<C-a>"] = actions.cycle_previewers_prev,
            ["<M-p>"] = action_layout.toggle_preview
          },
          n = {
            ["<M-p>"] = action_layout.toggle_preview
          },
        },
        pickers = {
          find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
            mappings = {
              n = {
                ["cd"] = function(prompt_bufnr)
                  local selection = require("telescope.actions.state").get_selected_entry()
                  local dir = vim.fn.fnamemodify(selection.path, ":p:h")

                  actions.close(prompt_bufnr)
                  vim.cmd(string.format("silent lcd %s", dir))
                end
              }
            }
          },
        },
        vimgrep_arguments = {
          "rg",
          "--with-filename",
          "--no-heading",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
          "--ignore-file",
          ".gitignore",
          "--hidden",
          "--glob=!.git/*"
        },
      }
    })

    require("telescope").load_extension("fzf")

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
  end
}
