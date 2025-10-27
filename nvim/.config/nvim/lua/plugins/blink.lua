vim.pack.add({
    {
        src = "https://github.com/rafamadriz/friendly-snippets",
        name = "friendly-snippets",
    },
    {
        src = "https://github.com/Saghen/blink.cmp",
        name = "blink",
    },
    {
        src = "https://github.com/giuxtaposition/blink-cmp-copilot",
        name = "blink-cmp-copilot",
    },
}, {
    load = true,
})

require("blink.cmp").setup({
    sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
            copilot = {
                name = "copilot",
                module = "blink-cmp-copilot",
                score_offset = 100,
                async = true,
            },
        },
    },
})
