local loader = require("utils.loader")

---@type lz.n.pack.Spec
local color_scheme = {
    src = "https://github.com/folke/tokyonight.nvim",
    data = {
        "tokyonight.nvim",
        colorscheme = "tokyonight",
        after = function()
            require("tokyonight").setup({
                style = "night",
            })
        end,
    }
}

---@type lz.n.pack.Spec
local eye_liner = {
    src = "https://github.com/jinh0/eyeliner.nvim",
    data = {
        "eyeliner.nvim",
        after = function()
            require("eyeliner").setup({
                highlight_on_key = true,
                dim = true,
                max_length = 9999,
                disabled_filetypes = { "NvimTree" },
                disabled_buftypes = { "nofile" },
                default_keymaps = true,
            })
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
local snacks = {
    src = "https://github.com/folke/snacks.nvim",
    data = {
        "snacks.nvim",
        keys = {
            { "<leader>de", function() Snacks.dim.enable() end,  desc = "Enable Dimming" },
            { "<leader>dd", function() Snacks.dim.disable() end, desc = "Diable Dimming" },
        },
        after = function()
            require("snacks").setup(
                {
                    dim = { enabled = true },
                    input = { enabled = true },
                }
            )
        end,
    }
}

loader.load_plugins({
    {
        plug = color_scheme,
    },
    {
        plug = eye_liner,
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
})
