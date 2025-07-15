local set = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

set("n", "<A-h>", "<C-w>h")
set("n", "<A-j>", "<C-w>j")
set("n", "<A-k>", "<C-w>k")
set("n", "<A-l>", "<C-w>l")

set("n", "<leader>e", ":NvimTreeToggle<CR>")

set("n", "<C-Up>", ":resize +2<CR>")
set("n", "<C-Down>", ":resize -2<CR>")
set("n", "<C-Left>", ":vertical resize -2<CR>")
set("n", "<C-Right>", ":vertical resize +2<CR>")

set("n", "<leader>bl", "<C-w>v")
set("n", "<leader>bj", "<C-w>s")

set("n", "<S-l>", ":bnext<CR>")
set("n", "<S-h>", ":bprev<CR>")

set("i", "jk", "<ESC>")

set("v", "<", "<gv")
set("v", ">", ">gv")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("x", "<leader>p", [["_dP]])
set("n", "<leader>bd", ":bdelete<CR>")

set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("t", "<C-h>", "<C-\\><C-N><C-w>h")
set("t", "<C-j>", "<C-\\><C-N><C-w>j")
set("t", "<C-k>", "<C-\\><C-N><C-w>k")
set("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- next greatest remap ever : asbjornHaland
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
set("i", "<C-c>", "<Esc>")

set("n", "Q", "<nop>")
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
set("n", "<leader>f", vim.lsp.buf.format)

set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

set("n", "<leader>gc", "<cmd>! gcc % -o %<.out && ./%<.out <CR>")

set("n", "<m-h>", "<C-w>h")
set("n", "<m-j>", "<C-w>j")
set("n", "<m-k>", "<C-w>k")
set("n", "<m-l>", "<C-w>l")

-- Center screen keymaps
set("n", "{", "{zz")
set("n", "}", "}zz")
set("n", "gg", "ggzz")
set("n", "G", "Gzz")
set("n", "n", "nzz")
set("n", "N", "Nzz")
set("n", "<C-u>", "<C-u>zz")
set("n", "<C-d>", "<C-d>zz")

set("n", "<Leader>ld", "o<ESC>")
set("n", "<Leader>lu", "O<ESC>")
set("n", "<Leader>d", "dd")
set("n", "<Leader><tab>", "V>")
set("n", "<Leader><s-tab>", "V<")
