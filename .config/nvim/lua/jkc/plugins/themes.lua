local theme = require("jkc.utils").theme

local config = {}

local onedark = {
    "olimorris/onedarkpro.nvim",
    name = "onedark",
    config = function()
        require("onedarkpro").setup({
            options = {
                transparency = true,
            }
        })
    end
}

local tokyonight = {
    "folke/tokyonight.nvim",
    config = function()
        require("tokyonight").setup({
            transparent = true,
            styles = {
                sidebars = "transparent",
                folders = "transparent",
            },
        })
        vim.o.background = "dark"
        vim.cmd.colorscheme(theme)
    end
}

table.insert(config, onedark)
table.insert(config, tokyonight)

return config
