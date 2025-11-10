-- LSP Setup
local languages = require("utils.installed_langs")
local lsp_servers = {}
for _, lang in ipairs(languages) do
    table.insert(lsp_servers, lang.lsp)
end

vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = lsp_servers,
})

vim.lsp.enable(lsp_servers)

-- Copilot LSP Config
vim.lsp.config("copilot", {
    settings = {
        telemetry = {
            telemetryLevel = "off",
        },
    },
})

vim.lsp.enable("copilot")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local buffer = ev.buf

        if client then
            -- Auto-format on save
            if client:supports_method("textDocument/formatting") then
                vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })

                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = buffer,
                    group = "LspFormatOnSave",
                    callback = function()
                        if not vim.g.format_on_save then
                            return
                        end

                        vim.lsp.buf.format({ bufnr = buffer, id = client.id })
                    end,
                })
            end
        end
    end,
})
