return {
  "saghen/blink.cmp",
  dependencies = {
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
  },
  build = function()
    require("blink.cmp").build():pwait()
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
      list = {
        selection = { preselect = true },
        cycle = { from_top = false },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
