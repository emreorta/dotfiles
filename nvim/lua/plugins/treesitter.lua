return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  main = "nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-context" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  config = function()
    local parsers = {
      "dockerfile",
      -- used by git
      "diff", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
      -- comes with nvim by default
      "c", "lua", "query", "vim", "vimdoc",
      "python",
      "markdown", "markdown_inline",
      -- other
      "make", "proto", "regex", "ssh_config", "tmux",
    }
    local installed = require("nvim-treesitter.config").get_installed()
    local to_install = vim.iter(parsers)
        :filter(function(p) return not vim.tbl_contains(installed, p) end)
        :totable()
    require("nvim-treesitter").install(to_install)
  end,
}
