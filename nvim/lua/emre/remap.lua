vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- replace without losing actual copy
-- example: copy "foo" to replace "bar". normally, you'd end up with "bar"
--          after copy-paste with just `p`. `<leader>p` allows you to paste
--          while keeping "foo" still in the clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- allows pasting whatever yanked within vim
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- easier navigation between panes
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- same but in terminal
vim.keymap.set("t", "<C-h>", "<cmd>wincmd <C-w>h<CR>")
vim.keymap.set("t", "<C-j>", "<cmd>wincmd <C-w>j<CR>")
vim.keymap.set("t", "<C-k>", "<cmd>wincmd <C-w>k<CR>")
vim.keymap.set("t", "<C-l>", "<cmd>wincmd <C-w>l<CR>")

-- adds`if err != nil` below
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- adds ipdb below for debugging
vim.keymap.set(
    "n",
    "<leader>ip",
    "o__import__('ipdb').set_trace()<CR><Esc>"
)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
