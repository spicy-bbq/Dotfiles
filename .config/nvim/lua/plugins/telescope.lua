return { 
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        local wk = require('which-key')
        wk.add({
            mode = {'n'},
            {'<leader>f', group = 'Telescope'},
            {'<leader>ff', function() builtin.find_files() end, desc = 'Find files'},
            {'<leader>fg', function() builtin.live_grep() end, desc = 'Grep'},
            {'<leader>fb', function() builtin.buffers() end, desc = 'Buffers'},
            {'<leader>fh', function() builtin.help_tags() end, desc = 'Help'},
        })
    end
}

