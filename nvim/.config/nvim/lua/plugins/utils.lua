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
local which_key = {
    src = "https://github.com/folke/which-key.nvim",
    data = {
        "which-key.nvim",
        event = "VimEnter",
        after = function()
            require("which-key").setup()
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
                highlight = {
                    on_put = {
                        higroup = "MySharedYankHighlight",
                        timer = 500,
                    },
                    on_yank = {
                        higroup = "MySharedYankHighlight",
                        timer = 500,
                    },
                },
            })

            -- Temp keymaps here
            vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
            vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
            vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
            vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

            vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
            vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
            vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
            vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
            vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
            vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

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
local undo_highlight = {
    src = "https://github.com/tzachar/highlight-undo.nvim",
    data = {
        "highlight-undo.nvim",
        after = function()
            require("highlight-undo").setup({})
        end,
    },
    lazy = false,
}

---@type lz.n.pack.Spec
local substitute = {
    src = "https://github.com/gbprod/substitute.nvim",
    data = {
        "substitute.nvim",
        after = function()
            require("substitute").setup(
                {
                    on_substitute = require("yanky.integration").substitute()
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
    src = "https://github.com/adriankarlen/plugin-view.nvim",
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

loader.load_plugins(
    {
        {
            plug = web_dev_icons,
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
            plug = oil_git,
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
            plug = substitute,
        },
        {
            plug = surround,
        },
        {
            plug = undo_highlight,
        },
        {
            plug = plugin_view,
        }
    })
