local config = {}

local mason_lspconfig = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function ()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls", "tsserver", "clangd"},
            handlers = {
                function(server_name)
                    if server_name == "lua_ls" then
                        require("lspconfig")[server_name].setup{
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = {"vim"}
                                    }
                                }
                            }
                        }
                    else
                        require("lspconfig")[server_name].setup{}
                    end
                end
            },
        })
    end
}

table.insert(config, mason_lspconfig)

return config
