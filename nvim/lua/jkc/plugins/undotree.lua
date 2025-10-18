local config = {}

local undotree = {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo history" })
    end
}

table.insert(config, undotree)

return config
