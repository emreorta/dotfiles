vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25-Cursor-blinkon250,r-cr-o:hor20"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "88"

vim.opt.wrap = false
vim.opt.linebreak = true

vim.g.python3_host_prog = os.getenv("VIRTUALENVS_HOME") .. "/neovim/bin/python"

vim.opt.jumpoptions = "view"

vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

vim.opt.list = true
vim.opt.completeopt = "menu,menuone,noselect"
