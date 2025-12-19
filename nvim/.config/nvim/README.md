Note for configuration

In root folder, init.lua

require('vuong.lsp') -> define all different keymaps for lsp

mason.lua file contains mason-lspconfig which automatically install all the 
lsp server

If you want to override default configuration, do it in
after/lsp/*server_name.lua*
