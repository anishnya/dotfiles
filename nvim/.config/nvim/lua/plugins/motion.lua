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

loader.load_plugins(
    {
        {
            plug = matchup,
        },
    }
)
