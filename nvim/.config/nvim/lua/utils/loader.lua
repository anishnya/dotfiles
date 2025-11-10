local M = {}
local lzn = require("lz.n")

---@class loader.PluginSpec
---@field deps? lz.n.pack.Spec[]
---@field plug lz.n.pack.Spec

---@type { [string]: boolean }
M.loaded_plugins = {}

---@param spec  lz.n.pack.Spec
local function add_plugin(spec)
    if not spec or not spec.src then
        return
    end

    -- Vim pack loader
    vim.pack.add(
        {
            {
                src = spec.src
            },
        },
        {
            load = function() end
        }
    )

    lzn.load({ spec.data })
end

---@param spec loader.PluginSpec
local function load_plugin(spec)
    -- Add the actual plugin
    add_plugin(spec.plug)
end

---@param specs loader.PluginSpec[]
function M.load_plugins(specs)
    for _, spec in ipairs(specs) do
        load_plugin(spec)
    end
end

return M
