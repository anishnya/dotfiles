local loader = require("utils.loader")

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
            require('smart-splits').setup()
        end
    }
}

loader.load_plugins(
    {
        {
            plug = splits,
        },
    }
)
