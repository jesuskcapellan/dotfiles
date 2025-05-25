return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local map = vim.keymap.set

            local on_attach = function(_, bufnr)
                local function opts(desc)
                    return { buffer = bufnr, noremap = true, silent = true, desc = "LSP " .. desc }
                end

                -- set keybinds
                map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts("Show references"))         -- show definition, references
                map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))                   -- go to declaration
                map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts("Show definitions"))       -- show lsp definitions
                map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts("Show implementations")) -- show lsp implementations
                map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts("Show type definitions")) -- show lsp type definitions
                map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions")) -- see available code actions, in visual mode will apply to selection
                map("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename"))                     -- smart rename
                map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts("Show buffer diagnostics")) -- show  diagnostics for file
                map("n", "<leader>d", vim.diagnostic.open_float, opts("Show line diagnostics"))      -- show diagnostics for line
                map("n", "[d", vim.diagnostic.goto_next, opts("Go to previous diagnostic"))          -- jump to previous diagnostic in buffer
                map("n", "]d", vim.diagnostic.goto_prev, opts("Go to next diagnostic"))              -- jump to next diagnostic in buffer
                map("n", "K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor")) -- show documentation for what is under cursor
                map("n", "<leader>rs", ":LspRestart<CR>", opts("Restart LSP"))                       -- mapping to restart lsp if necessary
            end

            local capabilities = cmp_nvim_lsp.default_capabilities()

            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- configure clangd server
            lspconfig["clangd"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure typescript server with plugin
            lspconfig["ts_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure tailwindcss server
            lspconfig["tailwindcss"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure golang server
            lspconfig["gopls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
            })

            -- configure python server
            lspconfig["pyright"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    python = {
                        analysis = {
                            autoImportCompletions = true,
                            autoSearchPaths = true,
                        },
                    },
                },
            })

            -- configure lua server (with special settings)
            lspconfig["lua_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = { -- custom settings for lua
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })
            local _border = "single"

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({
                border = _border,
            })

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({
                border = _border,
            })

            vim.diagnostic.config({
                float = { border = _border },
            })
        end,
    },
}
