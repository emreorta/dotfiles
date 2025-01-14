return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },
  { "onsails/lspkind.nvim" },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        formatting = lsp_zero.cmp_format({ details = true }),
        mapping = cmp.mapping.preset.insert({
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),

          ["<C-,>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-.>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-m>"] = cmp.mapping.confirm({ select = true }),
          ["<C-n>"] = cmp.mapping.complete(),

          ["<Tab>"] = cmp_action.tab_complete(),
          ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),

          -- scroll through the documentation windows
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
      })
    end
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      { "nvimtools/none-ls.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
      { "j-hui/fidget.nvim" },
      { "towolf/vim-helm" }
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })

        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
        vim.keymap.set("n", "md", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<C-g>", vim.lsp.buf.signature_help, opts)
      end)

      require("fidget").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,

          pyright = function()
            require("lspconfig").pyright.setup({})
          end,

          yamlls = function()
            require('lspconfig').yamlls.setup({
              settings = {
                yaml = {
                  -- schemaStore = { enable = true },
                  schemas = {
                    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                  },
                },
              }
            })
          end,
        }
      })

      -- lsp doesn't work for the following for some reason
      require("mason-null-ls").setup({
        ensure_installed = {
          "black",
          "prettier",
          "yamlfmt"
        }
      })

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.yamlfmt
        }
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
      })
    end,
  }
}
