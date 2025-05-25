local config = {}

local telescope = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git", "__pycache__"},
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
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}

table.insert(config, telescope)

return config
