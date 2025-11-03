-- Treesitter Setup
local languages = require("utils.installed_langs")
local languages_list = {}
for _, lang in ipairs(languages) do
    table.insert(languages_list, lang.language)
end

vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        name = "treesitter",
    },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter-context",
    },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
        src = "https://github.com/chrisgrieser/nvim-various-textobjs",
    },
})

require("treesitter-context").setup()

require("nvim-treesitter.configs").setup(
    {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = languages_list,
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
            enable = true,
        },
        indent = {
            enable = true
        },
        -- Tree Sitter Textobjects
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- Functions
                    ["af"] = { query = "@function.outer", desc = "Outer Function" },
                    ["if"] = { query = "@function.inner", desc = "Inner Function" },

                    -- Conditions
                    ["ac"] = { query = "@conditional.outer", desc = "Outer Conditional" },
                    ["ic"] = { query = "@conditional.inner", desc = "Inner Conditional" },

                    -- Loops
                    ["al"] = { query = "@loop.outer", desc = "Outer Loop" },
                    ["il"] = { query = "@loop.inner", desc = "Inner Loop" },

                    -- Assignments
                    ["aag"] = { query = "@assignment.outer", desc = "Outer Assignment" },
                    ["iag"] = { query = "@assignment.inner", desc = "Inner Assignment" },

                    ["aal"] = { query = "@assignment.lhs", desc = "LHS Assignment" },
                    ["aar"] = { query = "@assignment.rhs", desc = "RHS Assignment" },

                    -- Calls
                    ["ak"] = { query = "@call.outer", desc = "Outer Call" },
                    ["ik"] = { query = "@call.inner", desc = "Inner Call" },

                    -- Parameters
                    ["ap"] = { query = "@parameter.outer", desc = "Outer Parameter" },
                    ["ip"] = { query = "@parameter.inner", desc = "Inner Parameter" },

                },
                include_surrounding_whitespace = true,
            },
        }
    }
)

require("various-textobjs").setup({
    keymaps = {
        useDefaults = true
    }
})
