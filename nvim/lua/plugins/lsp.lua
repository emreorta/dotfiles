return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = true,
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason-lspconfig.nvim" },
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
      { "qvalentin/helm-ls.nvim", ft = "helm" },
      { "b0o/schemastore.nvim" },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local opts = { buffer = bufnr, remap = false }

          vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>fr", vim.lsp.buf.format)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<C-g>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, opts)
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, opts)
        end,
      })

      require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
          function ()
            local servers = require("config.lsp.servers")

            for server, config in pairs(servers) do
              vim.lsp.config(server, config or {})
            end
          end
        },
      })

      vim.diagnostic.config({
        float = true,
        underline = true,
        update_in_insert = false,
        virtual_text = { current_line = true },
        signs = true,
        severity_sort = false,
      })
    end,
  },
}
