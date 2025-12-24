-- LSP Setup
local lsp_servers = require("utils.installed_langs")

vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup(
    {
        ensure_installed = lsp_servers,
        automatic_enable = true,
    }
)

require("conform").setup({
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = function()
        if not vim.g.format_on_save then
            return
        end
        return {
            timeout_ms = 500,
            lsp_format = "fallback",
        }
    end,
    log_level = vim.log.levels.ERROR,
    notify_on_error = true,
    notify_no_formatters = true,
})
