vim.pack.add({
    {
        src = "https://github.com/nvim-mini/mini.ai",
    },
    {
        src = "https://github.com/nvim-mini/mini.pairs",
    },
    {
        src = "https://github.com/nvim-mini/mini.cmdline",
    },
}, {
    load = true,
})

-- require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.cmdline").setup()
