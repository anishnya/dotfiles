-- telescope
vim.pack.add({
    {
        src = "https://github.com/nvim-lua/plenary.nvim",
        name = "plenary",
    },
    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        name = "telescope",
    },
    {
        src = "https://github.com/debugloop/telescope-undo.nvim",
    },
})

require("telescope").setup()
require("telescope").load_extension("undo")
