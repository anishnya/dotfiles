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

-- TODO: epp
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

        ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
        ['<C-d>'] = { 'scroll_signature_down', 'fallback' },
        ['<C-k>'] = { 'show_signature', 'hide_signature', "fallback_to_mappings" },
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
    cmdline = {
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } },
    },
    signature = { enabled = true },
})
