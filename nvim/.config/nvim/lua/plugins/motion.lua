local loader = require("utils.loader")

---@type lz.n.pack.Spec
local treewalker = {
    src = "https://github.com/aaronik/Treewalker.nvim",
    data = {
        "Treewalker.nvim",
        command = "Treewalker",
        after = function()
            require("treewalker").setup()
        end,
    }
}

local matchup = {
    src = "https://github.com/andymass/vim-matchup",
    data = {
        "vim-matchup",
        event = "VimEnter",
        after = function()
            require("match-up").setup({
                treesitter = {
                    stopline = 500
                }
            })
        end,
    }
}


loader.load_plugins(
    {
        {
            plug = matchup,
        },
    })
