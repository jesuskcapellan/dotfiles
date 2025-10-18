return {
    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            require("gitsigns").setup({
              on_attach = function(bufnr)
                local gitsigns = require('gitsigns')
                local function map(mode, l, r, opts)
                  opts = opts or {}
                  opts.buffer = bufnr
                  vim.keymap.set(mode, l, r, opts)
                end

                map('n', '<leader>gb', function() gitsigns.blame_line({ full = true }) end, { desc = "Git blame" })
                map('n', '<leader>gd', gitsigns.diffthis, { desc = "View hunk diff" })
                map('n', '<leader>gD', function() gitsigns.diffthis('~') end, { desc = "View buffer diff" })
                map({'n','v'}, '<leader>gs', function() gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, { desc = "Stage/unstage hunk" })
                map({'n','v'}, '<leader>gr', function() gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')}) end, { desc = "Reset hunk" })
                map('n', '<leader>gS', gitsigns.stage_buffer, { desc = "Stage/unstage buffer" })
                map('n', '<leader>gR', gitsigns.reset_buffer, { desc = "Reset buffer" })
                map('n', '<leader>g[', function() gitsigns.nav_hunk('prev') end, { desc = "Prev hunk" })
                map('n', '<leader>g]', function() gitsigns.nav_hunk('next') end, { desc = "Next hunk" })
              end
            })
        end
    }
}
