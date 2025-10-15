return {
    'jbyuki/venn.nvim',
    config = function()
        function _G.Toggle_venn()
            local venn_enabled = vim.inspect(vim.b.venn_enabled)
            if venn_enabled == "nil" then
                vim.b.venn_enabled = true
                vim.cmd[[setlocal ve=all]]
                vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
                vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
                vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
                vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
                vim.api.nvim_buf_set_keymap(0, "v", "b", ":VBox<CR>", {noremap = true})
                vim.cmd(':set ve=all')
            else
                vim.cmd[[setlocal ve=]]
                vim.api.nvim_buf_del_keymap(0, "n", "J")
                vim.api.nvim_buf_del_keymap(0, "n", "K")
                vim.api.nvim_buf_del_keymap(0, "n", "L")
                vim.api.nvim_buf_del_keymap(0, "n", "H")
                vim.api.nvim_buf_del_keymap(0, "v", "b")
                vim.b.venn_enabled = nil
            end
        end

        local wk = require('which-key')
        wk.add({
            mode = {'n'},
            {'<leader>v', group = 'Visual'},
            {'<leader>vv', function() Toggle_venn() end, desc = 'Draw visual diagrams'},
        }) 
    end
}
