local loader = require("utils.loader")

---@type lz.n.pack.Spec
local comment = {
    src = "https://github.com/numToStr/Comment.nvim",
    data = {
        "Comment.nvim",
        after = function()
            require("Comment").setup()
        end,
    }
}

---@type lz.n.pack.Spec
local inline_diag = {
    src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
    data = {
        command = "BufEnter",
        "tiny-inline-diagnostic.nvim",
        after = function()
            require("tiny-inline-diagnostic").setup()
        end,
    }
}

---@type lz.n.pack.Spec
local dial = {
    src = "https://github.com/monaqa/dial.nvim",
    data = {
        "dial.nvim",
        keys = {
            { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, mode = "n" },
            { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, mode = "n" }
        },
        after = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group {
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.integer.alias.binary,
                    augend.constant.alias.bool,
                },
            }
        end,
    }
}

---@type lz.n.pack.Spec
local blink_indent = {
    src = "https://github.com/saghen/blink.indent",
    data = {
        command = "BufEnter",
        "blink.indent",
        after = function()
            require("blink.indent").setup()
        end,
    }
}

---@type lz.n.pack.Spec
-- local temp = "file:///Users/anishnya/Documents/personal_code/comfy-line-numbers.nvim"
-- local src_git = "https://github.com/anishnya/comfy-line-numbers.nvim",
local comfy_lines = {
    src = "https://github.com/anishnya/comfy-line-numbers.nvim",
    data = {
        "comfy-line-numbers.nvim",
        keys = {
            { "<leader>tl", function() require("comfy-line-numbers").enable_line_numbers() end,  mode = "n" },
            { "<leader>tk", function() require("comfy-line-numbers").disable_line_numbers() end, mode = "n" }
        },
        after = function()
            require("comfy-line-numbers").setup(
                {
                    default_statuscolumn = '%=%s%=%{v:virtnum > 0 ? "" : v:lua.line_numbering(v:lnum, v:relnum)}',
                }
            )
        end,
    }
}

---@type lz.n.pack.Spec
local friendly_snippets = {
    src = "https://github.com/rafamadriz/friendly-snippets",
    data = {
        "friendly-snippets",
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local lua_snips = {
    src = "https://github.com/L3MON4D3/LuaSnip",
    data = {
        "LuaSnip",
        before = function()
            local pack_info = vim.pack.get({ "LuaSnip" })
            local plug_path = pack_info[1].path
            local command = "cd " .. plug_path .. " && make install_jsregexp"
            vim.fn.system(command)
        end,
        after = function()
            local ls = require("luasnip")
            ls.setup({ enable_autosnippets = true })
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
        lazy = false,
    }
}

---@type lz.n.pack.Spec
local autopairs = {
    src = "https://github.com/windwp/nvim-autopairs",
    data = {
        "nvim-autopairs",
        after = function()
            require("nvim-autopairs").setup()
        end,
        lazy = false,
    }
}

loader.load_plugins(
    {
        {
            plug = comment,
        },
        {
            plug = dial,
        },
        {
            plug = inline_diag,
        },
        {
            plug = blink_indent,
        },
        {
            plug = friendly_snippets,
        },
        {
            plug = lua_snips,
        },
        {
            plug = autopairs,
        }
    })
