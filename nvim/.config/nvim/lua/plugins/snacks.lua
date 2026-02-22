local loader = require("utils.loader")

local snacks = {
    src = "https://github.com/folke/snacks.nvim",
    data = {
        "snacks.nvim",
        after = function()
            require("snacks").setup({
                dashboard = {
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua MiniPick.builtin.files()" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "o", desc = "Open Explorer", action = "<leader>=" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":lua MiniPick.builtin.grep()" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                    sections = {
                        { section = "header" },
                        {
                            pane = 2,
                            height = 5,
                            padding = 1,
                        },
                        { section = "keys", gap = 1, padding = 1 },
                        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                        {
                            pane = 2,
                            icon = " ",
                            title = "Git Status",
                            section = "terminal",
                            enabled = function()
                                return Snacks.git.get_root() ~= nil
                            end,
                            cmd = "git status --short --branch --renames",
                            height = 5,
                            padding = 1,
                            ttl = 5 * 60,
                            indent = 3,
                        },
                    },
                },
            })
        end,
        lazy = false,
    }
}

loader.load_plugins(
    {
        {
            plug = snacks,
        },
    }
)
