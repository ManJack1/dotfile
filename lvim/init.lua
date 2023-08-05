require"user.lsp"
require"lsp.setup"

vim.cmd('filetype plugin indent on')
vim.o.syntax ='enable'
vim.vimtex_view_method = 'skim'
vim.o.vimtex_compiler_method = 'latexmk'
vim.o.maplocalleader = ','
vim.o.clipboard = 'unnamed'

