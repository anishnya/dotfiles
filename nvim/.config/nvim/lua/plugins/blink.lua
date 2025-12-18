vim.pack.add({
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
    keymap = {
        ["<Tab>"] = { "snippet_forward", "fallback_to_mappings" },
        ["<M-Tab>"] = { "snippet_backward", "fallback_to_mappings" },
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
    fuzzy = {
        implementation = "prefer_rust",
        prebuilt_binaries = {
            download = true,
            force_version = '1.8'
        }
    },
    snippets = {
        preset = 'luasnip',
    },
    signature = { enabled = true },
})
