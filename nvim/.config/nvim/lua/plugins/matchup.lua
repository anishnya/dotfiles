vim.pack.add({
    {
        src = "https://github.com/andymass/vim-matchup"
    }
})

require("match-up").setup({
    treesitter = {
        stopline = 500
    }
})
