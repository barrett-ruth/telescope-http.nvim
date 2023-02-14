local ok, telescope = pcall(require, 'telescope')

if not ok then
    error 'Install nvim-telescope/telescope.nvim to use barrett-ruth/telescope-http.nvim.'
end

local list = require 'telescope._extensions.http.list'
local osname = require 'telescope._extensions.getOS'

local open_url_os = {
    ['OSX'] = { open_url = 'open %s' },
    ['Windows'] = { open_url = 'start %s' },
}

local default_opts = open_url_os[osname()]
if not default_opts then default_opts = { open_url = 'xdg-open %s' } end
local opts = {}

return telescope.register_extension {
    setup = function(http_opts, _)
        opts = vim.tbl_extend('force', default_opts, http_opts)
    end,
    exports = {
        list = function(_) list(_, opts) end,
    },
}
