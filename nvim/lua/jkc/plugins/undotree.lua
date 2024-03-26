local config = {}

local undotree = {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}

table.insert(config, undotree)

return config
