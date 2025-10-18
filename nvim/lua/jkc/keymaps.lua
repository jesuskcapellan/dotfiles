local set = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- General (insert)
set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
set("i", "<C-e>", "<End>", { desc = "End of line" })

set("i", "<C-h>", "<Left>", { desc = "Move left" })
set("i", "<C-j>", "<Down>", { desc = "Move down" })
set("i", "<C-k>", "<Up>", { desc = "Move up" })
set("i", "<C-l>", "<Right>", { desc = "Move right"})


-- General (normal)
set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

set("n", "<tab>", ":bnext<CR>", { desc = "Next buffer" })
set("n", "<S-tab>", ":bprev<CR>", { desc = "Previous buffer" })

set("n", "{", "{zz", { desc = "Previous blank line" })
set("n", "}", "}zz", { desc = "Next blank line" })
set("n", "gg", "ggzz", { desc = "Top of file" })
set("n", "G", "Gzz", { desc = "Bottom of file" })
set("n", "n", "nzz", { desc = "Next match" })
set("n", "N", "Nzz", { desc = "Previous buffer" })
set("n", "<C-u>", "<C-u>zz", { desc = "Up a page" })
set("n", "<C-d>", "<C-d>zz", { desc = "Down a page" })

set("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })


-- General (visual)
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line down" })

set("v", "<leader>y", [["+y]], { desc = "Copy selection to clipboard" })
set("v", "<leader>Y", [["+Y]], { desc = "Copy lines to clipboard" })

set("v", ">", ">gv", { desc = "Indent right" })
set("v", "<", "<gv", { desc = "Indent left" })
set("v", "<tab>", ">gv", { desc = "Indent right" })
set("v", "<s-tab>", "<gv", { desc = "Indent left" })


-- General (any)
set("x", "<leader>p", [["_dP]], { desc = "Paste without copying" })
