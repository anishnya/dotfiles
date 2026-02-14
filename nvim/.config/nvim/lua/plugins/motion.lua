local loader = require("utils.loader")

---@type lz.n.pack.Spec
local flash = {
    src = "https://github.com/folke/flash.nvim",
    data = {
        "flash.nvim",
        keys = {
            { "f" },
            { "F" },
            { "t" },
            { "T" },
            { "m", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        },
        after = function()
            require("flash").setup()
        end,
    }
}

---@type lz.n.pack.Spec
local matchup = {
    src = "https://github.com/andymass/vim-matchup",
    data = {
        "vim-matchup",
        after = function()
            require("match-up").setup({
                treesitter = {
                    stopline = 500
                }
            })
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local vai = {
    src = "https://github.com/johnpmitsch/vai.nvim",
    data = {
        "vai.nvim",
        after = function()
            require('vai').setup({
                trigger = '\\',
            })
        end,
        lazy = false,
    }
}

loader.load_plugins(
    {
        {
            plug = matchup,
        },
        {
            plug = flash,
        },
        {
            plug = vai,
        },
    }
)
