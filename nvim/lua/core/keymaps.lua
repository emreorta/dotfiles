vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- navigation --
-- open netrw
vim.keymap.set("n", "<leader>mv", vim.cmd.Ex)

-- move line(s) up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- apply the following commands but center view afterwards
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "gJ", "mzgJ`z")
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "gl", "$")
vim.keymap.set("n", "gh", "^")

-- allows using tab to cycle between brackets, curly brackets, parentheses etc.
vim.keymap.set({ "n", "v" }, "<Tab>", "%")

-- delete, replace, yank, paste, insert --
-- delete all buffers except current one
vim.keymap.set("n", "<leader>bd", ":bd|e#|bd#<CR>")

-- delete stuff without resetting the buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- replace the word under cursor globally
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])

-- replace the word under cursor in the same line only
vim.keymap.set("n", "<leader>ls", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- paste without resetting the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank whatever you want from vim and paste it elsewhere
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- yank the file contents
vim.keymap.set("n", "yaf", "<cmd>%y<CR>")

-- duplicate the line(s) and comment out the previous one(s)
vim.keymap.set("n", "yc", "yygccp", { remap = true })
vim.keymap.set("v", "<leader>C", "ygvgc`>p", { remap = true })

-- block insert in line in visual mode
vim.keymap.set("x", "A", function() return vim.fn.mode() == "V" and "$<C-v>A" or "A" end, { expr = true })
vim.keymap.set("x", "I", function() return vim.fn.mode() == "V" and "^<C-v>I" or "I" end, { expr = true })

-- ergonomics --
-- use ctrl-c as esc as well
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>;w", ":w<CR>")
vim.keymap.set("n", "<leader>;q", ":q<CR>")

-- repeat the last macro
vim.keymap.set("n", ",", "@@")

-- language specific stuff --
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
