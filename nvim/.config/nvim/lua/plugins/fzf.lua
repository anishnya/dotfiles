vim.pack.add({
    {
        src = "https://github.com/ibhagwan/fzf-lua",
        name = "fzf-lua",
    },
})

require("fzf-lua").setup({ "telescope" })
