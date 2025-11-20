-- Non plugin specific keymaps
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Undo Tree
keymap.set("n", "<leader>ut", "<cmd>Atone toggle<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>uf", "<cmd>Atone focus<CR>", { noremap = true, silent = true })

-- Substitute.nvim keymaps
keymap.set("n", "s", require('substitute').operator, { noremap = true })
keymap.set("n", "ss", require('substitute').line, { noremap = true })
keymap.set("n", "S", require('substitute').eol, { noremap = true })
keymap.set("x", "s", require('substitute').visual, { noremap = true })
-- Buffers
-- Cycle through buffers
keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Buffer management menu under <leader>b
keymap.set("n", "<leader>bc", "<cmd>bdelete<cr>", { desc = "Close Current Buffer" })
keymap.set("n", "<leader>bO", "<cmd>%bd|e#|bd#<cr>", { desc = "Close All Other Buffers (Focus)" })

-- You can also add a mapping to the first and last buffer
keymap.set("n", "<leader>b1", "<cmd>buffer 1<cr>", { desc = "Go to Buffer 1" })
keymap.set("n", "<leader>bl", "<cmd>buffer #<cr>", { desc = "Go to Last Buffer" })

keymap.set("n", "<leader>be", "<cmd>enew<cr>", { desc = "New Empty Buffer" })
keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })

-- Blank Lines
keymap.set('n', '<Leader>o', 'o<Esc>', { noremap = true, silent = true })
keymap.set('n', '<Leader>O', 'O<Esc>', { noremap = true, silent = true })
keymap.set('n', '<Leader>i', 'o<Esc>o', { noremap = true, silent = true })
keymap.set('n', '<Leader>I', 'O<Esc>O', { noremap = true, silent = true })

-- Treewalker Keymaps
keymap.set({ 'n', 'v' }, '<C-k>', '<cmd>Treewalker Up<cr>', { silent = true })
keymap.set({ 'n', 'v' }, '<C-j>', '<cmd>Treewalker Down<cr>', { silent = true })
keymap.set({ 'n', 'v' }, '<C-h>', '<cmd>Treewalker Left<cr>', { silent = true })
keymap.set({ 'n', 'v' }, '<C-l>', '<cmd>Treewalker Right<cr>', { silent = true })

keymap.set('n', '<C-S-k>', '<cmd>Treewalker SwapUp<cr>', { silent = true })
keymap.set('n', '<C-S-j>', '<cmd>Treewalker SwapDown<cr>', { silent = true })
keymap.set('n', '<C-S-h>', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
keymap.set('n', '<C-S-l>', '<cmd>Treewalker SwapRight<cr>', { silent = true })

-- LSP Buffer Format Keymap
keymap.set('n', '<leader>tf', function()
    vim.g.format_on_save = not vim.g.format_on_save
    --
    -- Show a notification with the new status
    if vim.g.format_on_save then
        vim.notify("Format on save: ON", vim.log.levels.INFO)
    else
        vim.notify("Format on save: OFF", vim.log.levels.INFO)
    end
end, { desc = '[T]oggle [F]ormat on Save' })

-- Other useful remaps
keymap.set("n", "Q", "<nop>")
