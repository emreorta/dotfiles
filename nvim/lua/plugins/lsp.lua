return {
    {
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
            },
            config = function()
                local lsp_zero = require("lsp-zero")
                lsp_zero.extend_lspconfig()

                lsp_zero.on_attach(function(client, bufnr)
                    lsp_zero.default_keymaps({ buffer = bufnr })

                    local opts = { buffer = bufnr, remap = false }
                    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr })
                    vim.keymap.set("n", "md", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<C-g>", function() vim.lsp.buf.signature_help() end, opts)
                end)

                require("mason-lspconfig").setup({
                    ensure_installed = {},
                    handlers = {
                        lsp_zero.default_setup,
                        lua_ls = function()
                            local lua_opts = lsp_zero.nvim_lua_ls()
                            require("lspconfig").lua_ls.setup(lua_opts)
                        end,
                    }
                })

                -- lsp doesn't work for the following for some reason
                require("mason-null-ls").setup({
                    ensure_installed = {
                        "black",
                        "yamlfmt"
                    }
                })

                local null_ls = require("null-ls")
                null_ls.setup({
                    sources = {
                        null_ls.builtins.formatting.black,
                        null_ls.builtins.formatting.yamlfmt
                    }
                })
            end
        },
        { "onsails/lspkind.nvim" },
    }
}
