return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
        config = function()
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.stylua,
                    require("none-ls.formatting.eslint_d"),
                    require("none-ls.diagnostics.eslint_d"),
                    require("none-ls.code_actions.eslint_d")
                },
                debug = true,
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                                vim.lsp.buf.format({ async = false })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
