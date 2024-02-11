local config = {}

local tokyonight = {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    })

    vim.cmd("colorscheme tokyonight")
  end
}

-- table.insert(config, onedark)
table.insert(config, tokyonight)

return config
