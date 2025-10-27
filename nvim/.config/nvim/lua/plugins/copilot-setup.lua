local plugins = {
    {

        src = "https://github.com/zbirenbaum/copilot.lua",
        data = {
            after = function()
                require("copilot").setup({
                    suggestion = { enabled = false },
                    panel = { enabled = false },
                })
            end,
        },
    },
}

vim.pack.add(plugins, { load = require("lz.n").load })
