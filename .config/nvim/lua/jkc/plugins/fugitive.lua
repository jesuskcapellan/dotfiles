local config = {}

local fugitive = {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
}

table.insert(config, fugitive)

return config

