
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- normal mode "n"

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- when highlight in visual mode can move it upper
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- and down

vim.keymap.set("n", "J", "mzJ`z") -- cursor stays in place when moving lines up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- jumping around file
vim.keymap.set("n", "n", "nzzzv") -- screen centeres around finding
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP") -- when pasting over something saves the paste

vim.keymap.set("n", "<leader>y", "\"+y") -- yanking text
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") -- find out what these actually do
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") -- try this

vim.keymap.set("n", "<leader>rf", ":vsp <CR><C-w><C-l> :term python % <CR>") -- find better way in furture?
vim.keymap.set("n", "<leader>to", ":term <CR>")
vim.keymap.set("t", "<leader>tc", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>wl", "<C-w>5>") -- window resizing which is cool
vim.keymap.set("n", "<leader>wh", "<C-w><C-h><C-w>5<<C-w><C-l>")
vim.keymap.set("n", "<leader>wj", "<C-w><C-j><C-w>1-<C-w><C-k>")
vim.keymap.set("n", "<leader>wk", "<C-w><C-k><C-W>1-<C-w><C-j>")


