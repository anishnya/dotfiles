-- Non plugin specific keymaps
local keymap = vim.keymap

-- Undo Tree
keymap.set("n", "<leader>ut", "<cmd>Atone toggle<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>uf", "<cmd>Atone focus<CR>", { noremap = true, silent = true })

-- Buffers
keymap.set("n", "<leader>bc", "<cmd>bdelete<cr>", { desc = "Close Current Buffer" })
keymap.set("n", "<leader>bO", "<cmd>%bd|e#|bd#<cr>", { desc = "Close All Other Buffers (Focus)" })

keymap.set("n", "<leader>b1", "<cmd>buffer 1<cr>", { desc = "Go to Buffer 1" })
keymap.set("n", "<leader>bl", "<cmd>buffer #<cr>", { desc = "Go to Last Buffer" })

keymap.set("n", "<leader>be", "<cmd>enew<cr>", { desc = "New Empty Buffer" })
keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })

-- LSP Buffer Format Keymap
keymap.set("n", "<leader>tf", function()
    vim.g.format_on_save = not vim.g.format_on_save
    --
    -- Show a notification with the new status
    if vim.g.format_on_save then
        vim.notify("Format on save: ON", vim.log.levels.INFO)
    else
        vim.notify("Format on save: OFF", vim.log.levels.INFO)
    end
end, { desc = '[T]oggle [F]ormat on Save' })

-- LSP Keymaps
keymap.set("n", "gao", function() vim.lsp.buf.outgoing_calls() end, { desc = "LSP Outgoing Calls" })
keymap.set("n", "gai", function() vim.lsp.buf.incoming_calls() end, { desc = "LSP Outgoing Calls" })
keymap.set("n", "gd", function() vim.lsp.buf.declaration() end, { desc = "LSP Declaration" })
keymap.set("n", "gD", function() vim.lsp.buf.defintion() end, { desc = "LSP Defintion" })
keymap.set("n", "go", function() vim.lsp.buf.document_symbol() end, { desc = "LSP Document Symbols" })
keymap.set("n", "gO", function() vim.lsp.buf.workspace_symbol() end, { desc = "LSP Workspace Symbols" })

-- Other useful remaps
keymap.set("n", "Q", "<nop>")
