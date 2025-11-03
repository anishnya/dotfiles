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
tree.setup({
    git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        disable_for_dirs = {},
        timeout = 400,
        cygwin_support = false,
    },
})
