return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
      vim.keymap.set("n", "<leader>gl", function()
        vim.cmd.Git("log")
      end)
      vim.keymap.set("n", "<leader>gw", vim.cmd.Gwrite)
      vim.keymap.set("n", "<leader>gpl", function()
        vim.cmd.Git("pull")
      end)
      vim.keymap.set("n", "<leader>gpsf", function()
        vim.cmd.Git("push --force-with-lease")
      end)
    end,
  },
  {
    "barrettruth/diffs.nvim",
    init = function()
      vim.g.diffs = {
        integrations = {
          fugitive = true,
          gitsigns = true,
          difftastic = true,
        },
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({

        -- keymap config taken from https://github.com/lewis6991/gitsigns.nvim#-keymaps
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- navigation through hunks
          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          -- stage and reset
          map("n", "<leader>hs", gitsigns.stage_hunk)
          map("n", "<leader>hr", gitsigns.reset_hunk)

          map("v", "<leader>hs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)

          map("v", "<leader>hr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end)

          map("n", "<leader>hS", gitsigns.stage_buffer)
          map("n", "<leader>hR", gitsigns.reset_buffer)

          -- preview
          map("n", "<leader>hp", gitsigns.preview_hunk)
          map("n", "<leader>hi", gitsigns.preview_hunk_inline)

          -- blame
          map("n", "<leader>hb", function()
            gitsigns.blame_line({ full = true })
          end)

          -- diff
          map("n", "<leader>hd", gitsigns.diffthis)

          map("n", "<leader>hD", function()
            gitsigns.diffthis("~")
          end)

          map("n", "<leader>hQ", function()
            gitsigns.setqflist("all")
          end)
          map("n", "<leader>hq", gitsigns.setqflist)

          -- toggles
          map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
          map("n", "<leader>tw", gitsigns.toggle_word_diff)

          -- text object
          map({ "o", "x" }, "ih", gitsigns.select_hunk)
        end,
      })
    end,
  },
  { "justinmk/guh.nvim" },
}
