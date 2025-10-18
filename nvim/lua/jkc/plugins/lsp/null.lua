return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "plenary.nvim", -- Make sure this dependency is added
    },
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          require("none-ls.formatting.eslint_d"),
          require("none-ls.diagnostics.eslint_d"),
          require("none-ls.code_actions.eslint_d"),
        },
        debug = true,
        on_attach = function(_, bufnr)
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                async = false,
                bufnr = bufnr,
                filter = function(client)
                  -- Use null-ls for formatting
                  return client.name == "null-ls"
                end
              })
            end,
          })
        end
      })
    end,
  },
}
