return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        --vim.keymap.set('n', '<leader>nt', ':Neotree filesystem reveal left<CR>')
        --vim.keymap.set('n', '<leader>nb', ':Neotree filesystem reveal bottom<CR>')

        local wk = require('which-key')
        wk.add({
            mode = {'n'},
            {'<leader>n', group = 'Neotree'},
            {'<leader>nt', ':Neotree filesystem reveal left<CR>', desc = 'Neotree left'},
            {'<leader>nb', ':Neotree filesystem reveal bottom<CR>', desc = 'Neotree bottom'},
        })

        require('neo-tree').setup({
            window = {
                width = 25,
                height = 10,
                position = 'bottom',
            }
        })
    end
}
