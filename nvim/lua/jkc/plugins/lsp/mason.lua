return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "clangd",
                "tailwindcss",
                "pyright",
                "gopls"
            },
        },
    }
}
