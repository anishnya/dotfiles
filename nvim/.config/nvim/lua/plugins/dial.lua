vim.pack.add({
    {
        src = "https://github.com/monaqa/dial.nvim",
    },
})

-- Augend Definitions
local augend = require("dial.augend")
require("dial.config").augends:register_group {
    default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.integer.alias.binary,
        augend.constant.alias.bool,
    },
}
