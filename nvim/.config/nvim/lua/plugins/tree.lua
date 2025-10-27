vim.pack.add({
    {
        src = "https://github.com/nvim-tree/nvim-web-devicons",
        name = "web-devicons",
    },
    {
        src = "https://github.com/nvim-tree/nvim-tree.lua",
        name = "tree",
    },
})

local tree = require("nvim-tree")
tree.setup({})
