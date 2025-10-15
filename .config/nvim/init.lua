
-- ███╗   ██╗██╗   ██╗ █████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║╚██╗ ██╔╝██╔══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║ ╚████╔╝ ███████║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║  ╚██╔╝  ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║   ██║   ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
-- NEOVIM CONFIG BY KIEFCIMAN

require('lazypath')
require('vim-options')
require('lazy').setup('plugins')
require('theme')
--require 'nvim-treesitter.install'.compilers = { "clang" }

vim.cmd('hi LineNr guibg=none guifg=#d9d0ee')
vim.opt.conceallevel = 3
