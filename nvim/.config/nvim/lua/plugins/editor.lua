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
local precognition = {
    src = "https://github.com/tris203/precognition.nvim",
    data = {
        command = "BufEnter",
        "precognition.nvim",
        after = function()
            require("precognition").setup()
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
local comfy_lines = {
    src = "https://github.com/mluders/comfy-line-numbers.nvim",
    data = {
        "comfy-line-numbers.nvim",
        keys = {
            { "<leader>tl", function() require("comfy-line-numbers").enable_line_numbers() end, mode = "n" },
            { "<leader>tk", function() require("comfy-line-numbers").disable_line_numbers() end, mode = "n" }
        },
        after = function()
            require("comfy-line-numbers").setup()
        end,
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
            plug = precognition,
        },
        {
            plug = blink_indent,
        },
        {
            plug = comfy_lines,
        }
    })
