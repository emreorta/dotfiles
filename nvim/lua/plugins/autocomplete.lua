return {
  "saghen/blink.cmp",
  dependencies = { 
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets"
  },
  build = function()
    require('blink.cmp').build():wait(60000)
  end,
  opts = {
    keymap = {
      preset = "default",

      -- keymap overrides
      ["<CR>"] = { "accept", "fallback" },
      ["<K>"] = { "show_signature", "hide_signature", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = false },
      list = {
        selection = { preselect = true },
        cycle = { from_top = false },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
