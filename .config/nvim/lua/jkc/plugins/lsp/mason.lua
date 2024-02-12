local config = {}

local nonels = {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function ()
        local augroup = vim.api.nvim_create_augroup("LspFormattig", {})
        local null_ls = require("null-ls")
        return {
            sources = {
                null_ls.builtins.formatting.prettierd,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr,
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        }
    end
}

local mason_lspconfig = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function ()
        require("mason").setup({
            opts = {
                ensure_installed = {
                    "lua",
                    "tsserver",
                    "clangd",
                    "tailwindcss",
                    "graphql",
                    "eslint-lsp",
                    "prettierd",
                },
            }
        })
        require("mason-lspconfig").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                }
            },
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "clangd",
                "tailwindcss",
                "graphql",
            },
            automatic_installation = true,
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
        require("mason-tool-installer").setup({
            ensure_installed = {
                "eslint",
                "prettier",
                "stylelint",
                "tailwindcss",
                "graphql",
            },
        })
    end
}

table.insert(config, mason_lspconfig)
table.insert(config, nonels)

return config
