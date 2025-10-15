return {
    'backdround/global-note.nvim',
    config = function()
        require('global-note').setup({
            filename = 'wiki.org',
            directory = '~/Documents/org/',
            title = '  Wiki  ',
            command_name = 'Wiki',
            autosave = false,
        })

        local wk = require('which-key')
        wk.add({
            mode = {'n'},
            {'<leader>w', group = 'Wiki'},
            {'<leader>ww', ':Wiki<CR>', desc = 'Wiki'},
        })
    end
}
