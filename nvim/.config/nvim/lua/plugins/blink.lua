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
        src = "https://github.com/fang2hou/blink-copilot",
        name = "blink-copilot",
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
                module = "blink-copilot",
                score_offset = 100,
                async = true,
            },
        },
    },
    completion = {
        menu = { border = "single" },
        list = { selection = { preselect = true, auto_insert = true } },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 100,
            window = { border = "single" },
        },
    },
})
