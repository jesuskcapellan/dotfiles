local config = {}

local lualine = {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "tokyonight",
            }
        })
    end
}

table.insert(config, lualine)

return config
