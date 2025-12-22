local loader = require("utils.loader")

---@type lz.n.pack.Spec
local oil = {
    src = "https://github.com/stevearc/oil.nvim",
    data = {
        "oil.nvim",
        keys = {
            { "<leader>=", function() require("oil").open() end, desc = "Oil" },
        },
        after = function()
            require("oil").setup({
                view_options = {
                    show_hidden = true,
                    is_hidden_file = function(name, bufnr)
                        local m = name:match("^%.")
                        return m ~= nil
                    end,
                    is_always_hidden = function(name, bufnr)
                        return false
                    end,
                    natural_order = "fast",
                    case_insensitive = false,
                    sort = {
                        { "type", "asc" },
                        { "name", "asc" },
                    },
                },
                keymaps = {
                    ["g?"] = { "actions.show_help", mode = "n" },
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                    ["<C-t>"] = { "actions.select", opts = { tab = true } },
                    ["<C-p>"] = "actions.preview",
                    ["<C-q>"] = { "actions.close", mode = "n" },
                    ["<C-r>"] = "actions.refresh",
                    ["-"] = { "actions.parent", mode = "n" },
                    ["_"] = { "actions.open_cwd", mode = "n" },
                    ["`"] = { "actions.cd", mode = "n" },
                    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                    ["gs"] = { "actions.change_sort", mode = "n" },
                    ["gx"] = "actions.open_external",
                    ["g."] = { "actions.toggle_hidden", mode = "n" },
                    ["g\\"] = { "actions.toggle_trash", mode = "n" },
                },
            })
        end,
    }
}

---@type lz.n.pack.Spec
local oil_git = {
    src = "https://github.com/anishnya/oil-git.nvim",
    data = {
        "oil-git.nvim",
        after = function()
            require("oil-git").setup({
                untracked_cache = true,
            })
        end,
        lazy = false,
    },
}

---@type lz.n.pack.Spec
local atone = {
    src = "https://github.com/XXiaoA/atone.nvim",
    data = {
        "atone.nvim",
        command = "Atone",
        after = function()
            require("atone").setup()
        end,
    }
}

---@type lz.n.pack.Spec
local diffview = {
    src = "https://github.com/sindrets/diffview.nvim",
    data = {
        "diffview.nvim",
        command = "Diffview",
    }
}

---@type lz.n.pack.Spec
local web_dev_icons = {
    src = "https://github.com/nvim-tree/nvim-web-devicons",
    data = {
        "nvim-web-devicons",
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local origami = {
    src = "https://github.com/chrisgrieser/nvim-origami",
    data = {
        "nvim-origami",
        after = function()
            require("origami").setup({
                useLspFoldsWithTreesitterFallback = true,
                pauseFoldsOnSearch = true,
                foldtext = {
                    enabled = true,
                    padding = 3,
                    lineCount = {
                        template = "%d lines", -- `%d` is replaced with the number of folded lines
                        hlgroup = "Comment",
                    },
                    diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
                    gitsignsCount = true,    -- requires `gitsigns.nvim`
                    disableOnFt = { "snacks_picker_input" }, ---@type string[]
                },
                autoFold = {
                    enabled = true,
                    kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
                },
                foldKeymaps = {
                    setup = true, -- modifies `h`, `l`, `^`, and `$`
                },
            })
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local which_key = {
    src = "https://github.com/folke/which-key.nvim",
    data = {
        "which-key.nvim",
        event = "VimEnter",
        after = function()
            require("which-key").setup()
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local tiny_glimmer = {
    src = "https://github.com/rachartier/tiny-glimmer.nvim",
    data = {
        "tiny-glimmer.nvim",
        after = function()
            require("tiny-glimmer").setup({
                enabled = true,
                disable_warnings = true,

                autoreload = false,
                refresh_interval_ms = 8,
                text_change_batch_timeout_ms = 50,

                -- Automatic keybinding overwrites
                overwrite = {
                    auto_map = true,

                    -- Yank operation animation
                    yank = {
                        enabled = true,
                    },

                    -- Search navigation animation
                    search = {
                        enabled = true,
                    },

                    -- Paste operation animation
                    paste = {
                        enabled = true,
                    },

                    -- Undo operation animation
                    undo = {
                        enabled = true,
                    },

                    -- Redo operation animation
                    redo = {
                        enabled = true,
                    },
                },

                -- Third-party plugin integrations
                support = {
                    substitute = {
                        enabled = true,
                    },
                },

                -- Special animation presets
                presets = {
                    pulsar = {
                        enabled = false,
                    },
                },

                hijack_ft_disabled = {
                    "alpha",
                    "snacks_dashboard",
                },
            })
        end,
    }
}

---@type lz.n.pack.Spec
local yanky = {
    src = "https://github.com/gbprod/yanky.nvim",
    data = {
        "yanky.nvim",
        after = function()
            vim.api.nvim_set_hl(0, "MySharedYankHighlight", { link = "IncSearch" })
            require("yanky").setup({
                textobj = {
                    enabled = true,
                },
            })

            -- Temp keymaps here
            vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
            vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
            vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
            vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

            vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
            vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
            vim.keymap.set("n", "]p", "<Plug>(YankyPutAfterLinewise)")
            vim.keymap.set("n", "[p", "<Plug>(YankyPutBeforeLinewise)")
            vim.keymap.set("n", "]P", "<Plug>(YankyGPutAfterLinewise)")
            vim.keymap.set("n", "[P", "<Plug>(YankyGPutBeforeLinewise)")

            vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
            vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
            vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
            vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")

            vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local substitute = {
    src = "https://github.com/gbprod/substitute.nvim",
    data = {
        "substitute.nvim",
        after = function()
            require("substitute").setup(
                {
                    on_substitute = require("yanky.integration").substitute(),
                    highlight_substituted_text = {
                        enabled = false,
                    },
                }
            )
            -- Substitute.nvim keymaps
            vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
            vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
            vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
            vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local surround = {
    src = "https://github.com/kylechui/nvim-surround",
    data = {
        "nvim-surround",
        after = function()
            require("nvim-surround").setup()
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local plugin_view = {
    -- "file:/// "
    src = "https://github.com/anishnya/plugin-view.nvim.git",
    data = {
        "plugin-view.nvim",
        keys = {
            { "<leader>y", function() require("plugin-view").open() end, desc = "Plugin View" },
        },
        after = function()
            require("plugin-view").setup()
        end,
    }
}

---@type lz.n.pack.Spec
local aerial = {
    src = "https://github.com/stevearc/aerial.nvim",
    data = {
        "aerial.nvim",
        keys = {
            { "<leader>a", function() require("aerial").toggle() end, desc = "Aerial Toggle" },
        },
        after = function()
            require("aerial").setup({
                backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
                on_attach = function(bufnr)
                    -- Jump forwards/backwards with '{' and '}'
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
            })
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local plenary = {
    src = "https://github.com/nvim-lua/plenary.nvim",
    data = {
        "plenary.nvim",
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local todo = {
    src = "https://github.com/folke/todo-comments.nvim",
    data = {
        "todo-comments.nvim",
        keys = {
            { "<leader>st", function() Snacks.picker.todo_comments() end,                                          desc = "Todo" },
            { "<leader>sT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
        },
        after = function()
            require("todo-comments").setup()
        end,
    }
}

---@type lz.n.pack.Spec
local illuminate = {
    src = "https://github.com/RRethy/vim-illuminate",
    data = {
        "vim-illuminate",
        after = function()
            require("illuminate").configure({
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                delay = 100,
                filetypes_denylist = {
                    'oil',
                    'dirbuf',
                    'dirvish',
                    'snacks_dashboard',
                },
            })
        end,
        lazy = false,
    }
}

local timber = {
    src = "https://github.com/Goose97/timber.nvim",
    data = {
        "timber.nvim",
        keys = {
            { "glj" },
            { "glk" },
            { "glb" },
            {
                "<leader>tt",
                function() require("timber.actions").toggle_comment_log_statements({ global = false }) end,
                desc = "Toggle Log Statements"
            },
            {
                "<leader>tc",
                function() require("timber.actions").clear_log_statements({ global = false }) end,
                desc = "Clear Log Statements"
            }
        },
        after = function()
            require("timber").setup()
        end
    }
}

loader.load_plugins(
    {
        {
            plug = plenary,
        },
        {
            plug = web_dev_icons,
        },
        {
            plug = todo,
        },
        {
            plug = atone,
        },
        {
            plug = diffview,
        },
        {
            plug = oil,
        },
        {
            plug = aerial,
        },
        {
            plug = which_key,
        },
        {
            plug = yanky,
        },
        {
            plug = tiny_glimmer,
        },
        {
            plug = substitute,
        },
        {
            plug = surround,
        },
        {
            plug = plugin_view,
        },
        {
            plug = origami,
        },
        {
            plug = illuminate,
        },
        {
            plug = timber,
        },
    }
)
