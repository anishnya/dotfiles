local loader = require("utils.loader")

---@type lz.n.pack.Spec
local color_scheme = {
    src = "https://github.com/rose-pine/neovim",
    data = {
        "neovim",
        colorscheme = "rose-pine",
        after = function()
            require("rose-pine").setup({
                variant = "moon",
            })
        end,
    }
}

---@type lz.n.pack.Spec
local quick_scope = {
    src = "https://github.com/unblevable/quick-scope",
    data = {
        "quick-scope",
        after = function()
            vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
            vim.g.qs_enable = 0
            vim.g.qs_lazy_highlight = 1

            vim.keymap.set("n", "<leader>q", "<plug>(QuickScopeToggle)", { noremap = true, silent = true })
        end,
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
    }
}

---@type lz.n.pack.Spec
local lualine = {
    src = "https://github.com/nvim-lualine/lualine.nvim",
    data = {
        "lualine.nvim",
        event = { "BufEnter" },
        after = function()
            require("lualine").setup({
                options = {
                    theme = "auto"
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
    }
}

---@type lz.n.pack.Spec
local nui = {
    src = "https://github.com/MunifTanjim/nui.nvim",
    data = {
        "nui.nvim",
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local notify = {
    src = "https://github.com/rcarriga/nvim-notify",
    data = {
        "nvim-notify",
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local noice = {
    src = "https://github.com/folke/noice.nvim",
    data = {
        "noice.nvim",
        after = function()
            require("noice").setup()
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

loader.load_plugins({
    {
        plug = color_scheme,
    },
    {
        plug = quick_scope,
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
})
