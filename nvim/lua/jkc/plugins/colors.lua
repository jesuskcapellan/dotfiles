return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = true,
            })
        end,
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                transparent = true,
                italic_comments = true,
                hide_fillchars = true,
                terminal_colors = false,
                cache = true,
                borderless_telescope = { border = false, style = "flat" },
                theme = { variant = "auto" },
            })
            vim.cmd("colorscheme cyberdream")
        end,
    },
}
