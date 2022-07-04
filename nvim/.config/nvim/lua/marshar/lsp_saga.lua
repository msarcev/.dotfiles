local saga = require 'lspsaga'

-- change the lsp symbol kind
local kind = require('lspsaga.lspkind')
kind[type_number][2] = icon -- see lua/lspsaga/lspkind.lua

-- use default config
saga.init_lsp_saga()
