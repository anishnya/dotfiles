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

-- LSP Keymaps and buffer config
local map = vim.keymap.set
local fzf = require("fzf-lua")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local buffer = ev.buf

        if client then
            -- Enable completion
            if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
                vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
                vim.lsp.completion.enable(true, client.id, buffer, { autotrigger = true })
                map("i", "<C-Space>", function()
                    vim.lsp.completion.get()
                end, { desc = "Trigger lsp completion" })
            end

            -- Add normal-mode keymappings for signature help
            if client:supports_method("textDocument/signatureHelp") then
                map("n", "<leader>ls", function()
                    vim.lsp.buf.signature_help()
                end, { desc = "Trigger lsp signature help" })
            end

            -- Auto-format on save
            if client:supports_method("textDocument/formatting") then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = buffer,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = buffer, id = client.id })
                    end,
                })
            end
        end
    end,
})

-- Diagnostics
vim.diagnostic.config({
    virtual_lines = {
        -- Only show virtual line diagnostics for the current cursor line
        current_line = true,
    },
})
