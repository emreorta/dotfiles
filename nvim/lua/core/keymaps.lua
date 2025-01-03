vim.g.mapleader = " "

-- open netrw
vim.keymap.set("n", "<leader>mv", vim.cmd.Ex)

-- move line(s) up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- apply the following commands but center view afterwards
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "G", "Gzz")
vim.keymap.set({ "n", "v" }, "gg", "ggzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- paste without resetting the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank whatever you want from vim and paste it elsewhere
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete stuff without resetting the buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- use ctrl-c as esc as well
vim.keymap.set("i", "<C-c>", "<Esc>")

-- disable Q
vim.keymap.set("n", "Q", "<nop>")

-- format the code using lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- replace the word under cursor globally
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- replace the word under cursor in the same line only
vim.keymap.set("n", "<leader>ls", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod +x your script from vim
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- easier navigation between panes
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- same as above but between tmux and vim
vim.keymap.set("t", "<C-h>", "<cmd>wincmd <C-w>h<CR>")
vim.keymap.set("t", "<C-j>", "<cmd>wincmd <C-w>j<CR>")
vim.keymap.set("t", "<C-k>", "<cmd>wincmd <C-w>k<CR>")
vim.keymap.set("t", "<C-l>", "<cmd>wincmd <C-w>l<CR>")

-- allows using tab to cycle between brackets, curly brackets, parentheses etc.
vim.keymap.set({ "n", "v" }, "<Tab>", "%")

-- adds`if err != nil` in the line below
vim.keymap.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- adds ipdb in the line below for debugging
vim.keymap.set(
  "n",
  "<leader>ip",
  "o__import__('ipdb').set_trace()<Esc>"
)

-- adds if __name__ == "__main__" in the line below
vim.keymap.set(
  "n",
  "<leader>nm",
  'oif __name__ == "__main__":<CR><Esc>"'
)

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- duplicate the line and comment out the previous one
vim.keymap.set("n", "yc", "yygccp", { remap = true })
vim.keymap.set("v", "<leader>C", "ygvgc`>p", { remap = true })

-- i got tired of typing :noh
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- copy the file contents
vim.keymap.set({ "n", "v" }, "<leader>yf", "<cmd>%y<CR>")

-- send current line to `sh` and replace with the output
vim.keymap.set("n" , "<C-s><C-s>" , ":.!sh<cr>" , { noremap = true })

-- block insert in line visual mode
vim.keymap.set("x", "A", function() return vim.fn.mode() == "V" and "$<C-v>A" or "A" end, { expr = true })
vim.keymap.set("x", "I", function() return vim.fn.mode() == "V" and "^<C-v>I" or "I" end, { expr = true })

-- for ergonomics
vim.keymap.set("n", "<leader>;w", ":w<CR>")
vim.keymap.set("n", "<leader>;q", ":q<CR>")
