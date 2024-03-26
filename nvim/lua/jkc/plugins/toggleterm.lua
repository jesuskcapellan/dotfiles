local config = {}

local toggleterm = {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
          size = 20,
          open_mapping = [[<c-\>]],
          direction = "horizontal",
          float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
              border = "Normal",
              background = "Normal",
            },
          }
        })
        vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true})
        vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", {noremap = true})
    end,
}

table.insert(config, toggleterm)

return config
