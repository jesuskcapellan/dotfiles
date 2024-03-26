return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "clangd",
            },
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            mason.setup({
                ui = {
                    package_installed = "",
                    package_pending = "➜",
                    package_uninstalled = "",
                },
            })

            mason_lspconfig.setup({
                ensure_installed = {
                    "tsserver",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "graphql",
                    "prismals",
                    "pyright",
                    "lua_ls",
                    "clangd",
                },

                automatic_installation = true,
            })
        end
    }
}
