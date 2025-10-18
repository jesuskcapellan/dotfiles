---@diagnostic disable: duplicate-set-field, deprecated
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

                local function bordered_hover(_opts)
                  _opts = _opts or {}
                  return vim.lsp.buf.hover(vim.tbl_deep_extend("force", _opts, {
                    border = 'rounded'
                  }))
                end

                -- set keybinds
                map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts("Show references"))
                map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts("Show definitions"))
                map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts("Show implementations"))
                map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts("Show type definitions"))
                map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
                map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions"))
                map("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename"))
                map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts("Show buffer diagnostics"))
                map("n", "<leader>d", vim.diagnostic.open_float, opts("Show line diagnostics"))
                map("n", "]d", vim.diagnostic.goto_next, opts("Previous diagnostic"))
                map("n", "[d", vim.diagnostic.goto_prev, opts("Next diagnostic"))
                map("n", "K", bordered_hover, opts("Show documentation"))
                map("n", "<leader>rs", ":LspRestart<CR>", opts("Restart LSP"))

            end

            local capabilities = cmp_nvim_lsp.default_capabilities()

            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end


            -- configure typescript server with plugin
            lspconfig["ts_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
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
