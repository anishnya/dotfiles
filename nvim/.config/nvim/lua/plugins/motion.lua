local loader = require("utils.loader")

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
local arrow = {
    src = "https://github.com/otavioschwanck/arrow.nvim",
    data = {
        "arrow.nvim",
        event = "VimEnter",
        after = function()
            require('arrow').setup({
                show_icons = true,
                leader_key = ';',        -- Recommended to be a single key
                buffer_leader_key = 'm', -- Per Buffer Mappings
            })
        end,
    }
}

loader.load_plugins(
    {
        {
            plug = matchup,
        },
        -- {
        --     plug = arrow,
        -- }
    })
