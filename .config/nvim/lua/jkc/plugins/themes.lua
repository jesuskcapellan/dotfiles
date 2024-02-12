local config = {}

local catpuccin = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato",
            transparent_background = true,
        })
        vim.cmd("colorscheme catppuccin")
    end
}

local lualine = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "folke/noice.nvim",
    },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'catppuccin',
                icons_enabled = true,
                component_separators = '',
                section_separators = '',
            },
        }
    end
}

-- table.insert(config, onedark)
-- table.insert(config, tokyonight)
table.insert(config, catpuccin)
table.insert(config, lualine)

return config
