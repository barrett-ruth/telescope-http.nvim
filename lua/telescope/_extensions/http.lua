local ok, telescope = pcall(require, 'telescope')

if not ok then
    error 'Install nvim-telescope/telescope.nvim to use barrett-ruth/telescope-http.nvim.'
end

local list = require 'telescope._extensions.http.list'

local default_opts = { open_url = 'xdg-open %s' }
local opts = {}

return telescope.register_extension {
    setup = function(http_opts, _)
        opts = vim.tbl_extend('force', default_opts, http_opts)
    end,
    exports = {
        list = function(_) list(_, opts) end,
    },
}
