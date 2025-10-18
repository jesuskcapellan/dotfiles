local config = {}

local telescope = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git", "__pycache__" },
      },
      pickers = {
        find_files = {
          find_command = {
            'rg',
            '--files',
            '-L'
          }
        },
      },
    })
    local set = vim.keymap.set
    -- General fuzzy finds
    set('n', '<leader>ff', "<cmd> Telescope find_files <CR>", { desc = "Find files" })
    set('n', '<leader>fa', "<cmd> Telescope find_files no_ignore=true hidden=true <CR>", { desc = "Find all" })
    set('n', '<leader>fw', "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
    set('n', '<leader>fb', "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
    set('n', '<leader>fz', "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" })

    -- Git fuzzy finds
    set('n', '<leader>fc', "<cmd> Telescope git_commits <CR>", { desc = "Git commits" })
    set('n', '<leader>fg', "<cmd> Telescope git_status <CR>", { desc = "Git status" })
  end
}

table.insert(config, telescope)

return config
