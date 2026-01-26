local loader = require("utils.loader")

---@type lz.n.pack.Spec
local color_scheme = {
    src = "https://github.com/serhez/teide.nvim",
    data = {
        "teide.nvim",
        after = function()
            require("teide").setup({
                style = "dimmed",
            })

            vim.cmd.colorscheme("teide-dimmed")
        end,
        lazy = false,
    }

}

---@type lz.n.pack.Spec
local quick_scope = {
    src = "https://github.com/unblevable/quick-scope",
    data = {
        "quick-scope",
        after = function()
            vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
            vim.g.qs_enable = 1
            vim.g.qs_lazy_highlight = 1

            vim.keymap.set("n", "<leader>q", "<plug>(QuickScopeToggle)", { noremap = true, silent = true })
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local smear_cursor = {
    src = "https://github.com/sphamba/smear-cursor.nvim",
    data = {
        "smear-cursor.nvim",
        after = function()
            require("smear_cursor").setup({
                smear_between_buffers = false,
                smear_between_neighbor_lines = true,
                scroll_buffer_space = true,
                legacy_computing_symbols_support = false,
                smear_insert_mode = true,
            })
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local nvim_colorizer = {
    src = "https://github.com/catgoose/nvim-colorizer.lua",
    data = {
        "nvim-colorizer.lua",
        after = function()
            require("colorizer").setup()
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local colorful_menu = {
    src = "https://github.com/xzbdmw/colorful-menu.nvim",
    data = {
        "colorful-menu.nvim",
        after = function()
            require("colorful-menu").setup()
        end,
        laxy = false,
    }
}

---@type lz.n.pack.Spec
local lualine = {
    src = "https://github.com/nvim-lualine/lualine.nvim",
    data = {
        "lualine.nvim",
        after = function()
            require("lualine").setup({
                options = {
                    theme = "teide",
                },
                sections = {
                    lualine_c = {
                        {
                            "filename",
                            path = 1,
                        },
                    },
                },
            })
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local modicator = {
    src = "https://github.com/mawkler/modicator.nvim",
    data = {
        "modicator.nvim",
        after = function()
            require('modicator').setup({
                show_warnings = false,
                highlights = {
                    defaults = {
                        bold = true,
                        italic = false,
                    },
                    use_cursorline_background = true,
                },
                integration = {
                    lualine = {
                        enabled = true,
                        mode_section = "a",
                        highlight = 'bg',
                    },
                },
            })
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local fidget = {
    src = "https://github.com/j-hui/fidget.nvim",
    data = {
        "fidget.nvim",
        after = function()
            require("fidget").setup()
        end,
        lazy = false,
    },
}

---@type lz.n.pack.Spec
local hl_args = {
    src = "https://github.com/m-demare/hlargs.nvim",
    data = {
        "hlargs.nvim",
        after = function()
            require("hlargs").setup()
        end,
    }
}

---@type lz.n.pack.Spec
local win_seperator = {
    src = "https://github.com/nvim-zh/colorful-winsep.nvim",
    data = {
        "colorful-winsep.nvim",
        after = function()
            require("colorful-winsep").setup()
        end,
        event = "WinLeave",
    }
}

---@type lz.n.pack.Spec
local statuscol = {
    src = "https://github.com/luukvbaal/statuscol.nvim",
    data = {
        "statuscol.nvim",
        after = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                setopt = true,      -- Automatically set the 'statuscolumn' option
                relculright = true, -- Right-align relative line numbers
                segments = {
                    {
                        sign = { namespace = { "gitsigns" }, colwidth = 1, wrap = true },
                        click = "v:lua.ScSa",
                    },
                    {
                        sign = {
                            namespace = { "diagnostic.signs" },
                            colwidth = 1,
                            maxwidth = 1,
                        },
                        click = "v:lua.ScSa",
                    },
                    {
                        text = { builtin.lnumfunc, " " },
                        condition = { true, builtin.not_empty },
                        click = "v:lua.ScLa",
                    },
                    {
                        text = { "┃ " },
                    },
                },
                ft_ignore = {
                    "oil",
                    "aerial",
                    "help",
                    "mason",
                    "snacks_picker_input",
                    "snacks_picker_preview",
                },
                bt_ignore = { "nofile", "terminal" },
            })
        end,
        lazy = false,
    }
}

loader.load_plugins({
    {
        plug = color_scheme,
    },
    {
        plug = smear_cursor,
    },
    {
        plug = nvim_colorizer,
    },
    {
        plug = colorful_menu,
    },
    {
        plug = lualine,
    },
    {
        plug = hl_args,
    },
    {
        plug = fidget,
    },
    {
        plug = modicator,
    },
    {
        plug = quick_scope,
    },
    {
        plug = win_seperator,
    },
    {
        plug = statuscol,
    },
})
