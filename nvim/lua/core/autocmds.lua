-- highlights a yanked lines for a short while
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Highlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }
  end,
})

-- uses treesitter for folding if there's a parser available for that language
vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "syntax"
    end
  end,
})

-- detects helm files
vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})

-- resizes splits automatically when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

-- restores cursor to file position in the previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
    end
  end,
})

-- dynamic line numbers
-- absolute numbers in insert mode, relative numbers else
vim.api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
  { pattern = "*", command = "if &nu && mode() != 'i' | set rnu | endif", }
)

vim.api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
  { pattern = "*", command = "if &nu | set nornu | endif", }
)
