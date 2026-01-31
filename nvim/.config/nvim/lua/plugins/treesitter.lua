local loader = require("utils.loader")

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
            local ts = require("treesitter-modules")
            ts.setup({
                fold = { enable = true },
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = { enable = true },
            })

            vim.keymap.set('n', 'gkn', ts.init_selection, { desc = "Treesitter Incremental Selection" })
            vim.keymap.set('x', 'gkn', ts.node_incremental)
            vim.keymap.set('x', 'gkc', ts.scope_incremental)
            vim.keymap.set('x', 'gkm', ts.node_decremental)
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
            require("nvim-treesitter-textobjects").setup({
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
            vim.keymap.set({ "x", "o" }, "af", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "if", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "]f", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[f", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "]F", function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[F", function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
            end)

            -- Loops
            vim.keymap.set({ "x", "o" }, "al", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "il", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
            end)

            -- Conditionals
            vim.keymap.set({ "x", "o" }, "ac", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ic", function()
                require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "]c", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[c", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "]C", function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[C", function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects")
            end)

            -- Comments
            vim.keymap.set({ "x", "o" }, "at", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@comment.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "it", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@comment.inner", "textobjects")
            end)

            -- Assignments
            vim.keymap.set({ "x", "o" }, "a=", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@assignment.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "i=", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@assignment.inner", "textobjects")
            end)

            -- Parameters
            vim.keymap.set({ "x", "o" }, "ar", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@paramter.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ir", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "]r", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[r", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
            end)

            -- Folds
            vim.keymap.set({ "n", "x", "o" }, "]z", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[z", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@fold", "folds")
            end)
            vim.keymap.set({ "n", "x", "o" }, "]Z", function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@fold", "folds")
            end)
            vim.keymap.set({ "n", "x", "o" }, "[Z", function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@fold", "folds")
            end)

            -- Repeat movement with ; and ,
            local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
            vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
            vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

            -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
            vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
            vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
            vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
            vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
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
                    useDefaults = false,
                }
            })

            -- Chain members
            vim.keymap.set({ "o", "x" }, "am", function() require("various-textobjs").chainMember("outer") end)
            vim.keymap.set({ "o", "x" }, "im", function() require("various-textobjs").chainMember("inner") end)

            -- Quotes
            vim.keymap.set({ "o", "x" }, "aq", function() require("various-textobjs").anyQuote("outer") end)
            vim.keymap.set({ "o", "x" }, "iq", function() require("various-textobjs").anyQuote("inner") end)

            -- Arguements
            vim.keymap.set({ "o", "x" }, "a,", function() require("various-textobjs").closedFold("outer") end)
            vim.keymap.set({ "o", "x" }, "i,", function() require("various-textobjs").closedFold("inner") end)

            -- Folds
            vim.keymap.set({ "o", "x" }, "az", function() require("various-textobjs").argument("outer") end)
            vim.keymap.set({ "o", "x" }, "iz", function() require("various-textobjs").argument("inner") end)

            -- Keys
            vim.keymap.set({ "o", "x" }, "ak", function() require("various-textobjs").key("outer") end)
            vim.keymap.set({ "o", "x" }, "ik", function() require("various-textobjs").key("inner") end)

            -- Values
            vim.keymap.set({ "o", "x" }, "av", function() require("various-textobjs").value("outer") end)
            vim.keymap.set({ "o", "x" }, "iv", function() require("various-textobjs").value("inner") end)
        end,
        lazy = false
    }
}

local treesitter_sj = {
    src = "https://github.com/Wansmer/treesj",
    data = {
        "treesj",
        keys = {
            {
                "<leader>l", function() require('treesj').split() end, desc = "Treesj Split",
            },
            {
                "<leader>j", function() require('treesj').join() end, desc = "Treesj Join",
            },
            {
                "<leader>m", function() require('treesj').toggle() end, desc = "Treesj Toggle",
            }
        },
        after = function()
            require("treesj").setup()
        end,
    }
}

local treewalker = {
    src = "https://github.com/aaronik/treewalker.nvim",
    data = {
        "treewalker.nvim",
        after = function()
            require("treewalker").setup()

            -- movement
            vim.keymap.set({ 'n', 'v' }, '<C-k>', '<cmd>Treewalker Up<cr>', { silent = true })
            vim.keymap.set({ 'n', 'v' }, '<C-j>', '<cmd>Treewalker Down<cr>', { silent = true })
            vim.keymap.set({ 'n', 'v' }, '<C-h>', '<cmd>Treewalker Left<cr>', { silent = true })
            vim.keymap.set({ 'n', 'v' }, '<C-l>', '<cmd>Treewalker Right<cr>', { silent = true })

            -- swapping
            vim.keymap.set('n', '<C-S-k>', '<cmd>Treewalker SwapUp<cr>', { silent = true })
            vim.keymap.set('n', '<C-S-j>', '<cmd>Treewalker SwapDown<cr>', { silent = true })
            vim.keymap.set('n', '<C-S-h>', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
            vim.keymap.set('n', '<C-S-l>', '<cmd>Treewalker SwapRight<cr>', { silent = true })
        end,
        lazy = false
    }
}

local ts_auto_tag = {
    src = "https://github.com/windwp/nvim-ts-autotag",
    data = {
        "nvim-ts-autotag",
        after = function()
            require("nvim-ts-autotag").setup()
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
        },
        {
            plug = treesitter_sj,
        },
        {
            plug = treewalker,
        },
        {
            plug = ts_auto_tag,
        }
    }
)
