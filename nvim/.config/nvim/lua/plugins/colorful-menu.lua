vim.pack.add({
    {
        src = "https://github.com/xzbdmw/colorful-menu.nvim",
    },
})

local colorful_menu = require("colorful-menu")
colorful_menu.setup()
