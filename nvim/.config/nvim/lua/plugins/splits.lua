local loader = require("utils.loader")
local ignore_filetypes = { "oil", "snacks_picker_input", "mason", "snacks_dashboard" }

local splits = {
    src = "https://github.com/mrjones2014/smart-splits.nvim",
    data = {
        "smart-splits.nvim",
        keys = {
            { "<A-h>",             function() require("smart-splits").resize_left() end },
            { "<A-j>",             function() require("smart-splits").resize_down() end },
            { "<A-k>",             function() require("smart-splits").resize_up() end },
            { "<A-l>",             function() require("smart-splits").resize_right() end },
            { "<C-w-h>",           function() require("smart-splits").move_cursor_left() end },
            { "<C-w-j>",           function() require("smart-splits").move_cursor_down() end },
            { "<C-w-k>",           function() require("smart-splits").move_cursor_up() end },
            { "<C-w-l>",           function() require("smart-splits").move_cursor_right() end },
            { "<leader><leader>h", function() require("smart-splits").swap_buf_left() end },
            { "<leader><leader>j", function() require("smart-splits").swap_buf_down() end },
            { "<leader><leader>k", function() require("smart-splits").swap_buf_up() end },
            { "<leader><leader>l", function() require("smart-splits").swap_buf_right() end },
        },
        after = function()
            require('smart-splits').setup(
                {
                    move_cursor_same_row = true,
                    cursor_follows_swapped_bufs = true,
                }
            )
        end
    }
}

local focus = {
    src = "https://github.com/nvim-focus/focus.nvim",
    data = {
        "focus.nvim",
        keys = {
            { "<leader>wh", function() require("focus").split_command("h") end, desc = "Split Left" },
            { "<leader>wj", function() require("focus").split_command("j") end, desc = "Split Up" },
            { "<leader>wk", function() require("focus").split_command("k") end, desc = "Split Down" },
            { "<leader>wl", function() require("focus").split_command("l") end, desc = "Split Right" },
            { "<leader>wn", function() require("focus").split_nicely() end,     desc = "Split Evenly" },
            { "<leader>ss", function() require("focus").split_command("j") end, desc = "Split Horiztonal" },
            { "<leader>sv", function() require("focus").split_command("l") end, desc = "Split Vertical" },
        },
        after = function()
            require("focus").setup({
                enable = true,
                commands = true,
                autoresize = {
                    enable = true,
                    width = 0,
                    height = 0,
                    minwidth = 0,
                    minheight = 0,
                    focusedwindow_minwidth = 0,
                    focusedwindow_minheight = 0,
                    height_quickfix = 10,
                },
                split = {
                    bufnew = true,
                },
                ui = {
                    number = false,
                    relativenumber = false,
                    hybridnumber = false,
                    absolutenumber_unfocussed = false,

                    cursorline = false,
                    cursorcolumn = false,
                    colorcolumn = {
                        enable = false,
                        list = '+1',
                    },
                    signcolumn = false,
                    winhighlight = true,
                }
            })

            -- Regular Keymaps
            vim.keymap.set("n", "<leader>we", "<cmd>:FocusEqualise<CR>")
            vim.keymap.set("n", "<leader>wm", "<cmd>:FocusMaximise<CR>")
            vim.keymap.set("n", "<leader>wq", "<cmd>:FocusMaxOrEqual<CR>")
            vim.keymap.set("n", "<leader>wt", "<cmd>:FocusToggle<CR>")

            -- Autocmd for specific filetypes
            local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

            vim.api.nvim_create_autocmd('FileType', {
                group = augroup,
                callback = function(_)
                    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
                        vim.b.focus_disable = true
                    else
                        vim.b.focus_disable = false
                    end
                end,
                desc = 'Disable focus autoresize for FileType',
            })
        end
    }
}

loader.load_plugins(
    {
        {
            plug = splits,
        },
        {
            plug = focus,
        },
    }
)
