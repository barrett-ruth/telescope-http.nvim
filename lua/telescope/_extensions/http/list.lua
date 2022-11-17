local actions = require 'telescope.actions'
local finders = require 'telescope.finders'
local pickers = require 'telescope.pickers'
local sorters = require 'telescope.sorters'
local state = require 'telescope.actions.state'

local codes = require 'telescope._extensions.http.codes'

return function(_, http_opts)
    pickers
        .new(_, {
            prompt_title = 'HTTP Codes',
            finder = finders.new_table {
                results = vim.tbl_keys(codes),
            },
            sorter = sorters.get_generic_fuzzy_sorter(),
            attach_mappings = function(prompt_bufnr, _)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)

                    local selection = state.get_selected_entry()
                    local link = codes[selection[1]]

                    vim.fn.jobstart(http_opts.open_url:format(link))
                end)
                return true
            end,
        })
        :find()
end
