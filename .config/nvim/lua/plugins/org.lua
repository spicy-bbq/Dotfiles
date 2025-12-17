return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/Documents/org/tasks/**/*',
      org_default_notes_file = '~/Documents/org/notes/quick.org',
      org_startup_folded = 'showeverything',
      win_split_mode = 'float',
      org_hide_emphasis_markers = true,
      org_startup_indented = false,
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
    --
    local wk = require('which-key')
    wk.add({
        mode = {'n'},
        {'<leader>o', group = 'Org'},
        {'<leader>oa', ':Org agenda<CR>', desc = 'Org agenda'},
        {'<leader>oc', ':Org capture<CR>', desc = 'Org capture'} 
    })
  end,
}
