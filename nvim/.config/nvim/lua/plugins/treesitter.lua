local loader = require("utils.loader")

-- Treesitter Setup
local languages = require("utils.installed_langs")
local languages_list = {}
for _, lang in ipairs(languages) do
    if lang.language then
        table.insert(languages_list, lang.language)
    end
end

local treesitter = {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
    data = {
        "nvim-treesitter",
        after = function()
            vim.cmd([[TSUpdate]])
        end,
        lazy = false
    }
}

local treesitter_modules = {
    src = "https://github.com/MeanderingProgrammer/treesitter-modules.nvim",
    data = {
        "treesitter-modules.nvim",
        after = function()
            require("treesitter-modules").setup({
                ensure_installed = languages_list,
                fold = { enable = true },
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = { enable = true },
            })
        end,
        lazy = false
    }
}

local treesitter_text_objs = {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
    data = {
        "nvim-treesitter-textobjects",
        after = function()
            require("nvim-treesitter-textobjects").setup ({
                select = {
                    lookahead = true,
                    include_surrounding_whitespace = false,
                },
                move = {
                    set_jumps = true,
                },
            })

            -- Keymaps
            -- Functions
            vim.keymap.set({ "x", "o" }, "am", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "im", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "]m", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[m", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "]M", function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[M", function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
            end)

            -- Loops
            vim.keymap.set({ "x", "o" }, "al", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "il", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
            end)

            -- Conditionals
            vim.keymap.set({ "x", "o" }, "ac", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ic", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
            end)

            -- Comments
            vim.keymap.set({ "x", "o" }, "at", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@comment.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "it", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@comment.inner", "textobjects")
            end)
        end,
        lazy = false
    }
}

local treesitter_context = {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-context",
    data = {
        "nvim-treesitter-context",
        after = function()
            require("treesitter-context").setup()
        end,
        lazy = false
    }
}

local treesitter_various = {
    src = "https://github.com/chrisgrieser/nvim-various-textobjs",
    data = {
        "nvim-various-textobjs",
        after = function()
            require("various-textobjs").setup({
                keymaps = {
                    useDefaults = true,
                }
            })
        end,
        lazy = false
    }
}


loader.load_plugins(
    {
        {
            plug = treesitter,
        },
        {
            plug = treesitter_modules,
        },
        {
            plug = treesitter_text_objs,
        },
        {
            plug = treesitter_context,
        },
        {
            plug = treesitter_various,
        }
    }
)
