local config = {}

local toggleterm = {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
          open_mapping = [[<c-\>]],
          direction = "float",
          float_opts = {
            border = "curved",
            highlights = {
              border = "Normal",
              background = "Normal",
            },
            height = 40,
            width = 210,
          }
        })
        vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true})
    end,
}

table.insert(config, toggleterm)

return config
