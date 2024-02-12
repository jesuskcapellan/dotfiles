local config = {}

local telescope = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    width = 0.5,
                    height = 0.5,
                },
                preview = false,
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ph', function ()
            builtin.find_files({ hidden = true })
        end)
        vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}

table.insert(config, telescope)

return config
