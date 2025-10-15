return {
    'folke/which-key.nvim',
    event = 'VeryLazy' ,
    opts = {
        triggers = {
            { "<leader>", mode = { "n", "v" } },
            { "<auto>", mode = "nxso" },
        },
        win = {
            --border = 2.0,
        },
    },
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({global = false})
            end,
            desc = 'Local'
        }
    }
}
