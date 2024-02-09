local theme = require("jkc.utils").theme

local config = {}

local lualine = {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = theme,
            }
        })
    end
}

table.insert(config, lualine)

return config
