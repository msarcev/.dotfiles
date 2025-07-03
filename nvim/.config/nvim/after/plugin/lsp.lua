local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

local lspconfig = require('lspconfig')

-- Pre-configure lua_ls to avoid the vim global warning
lspconfig.lua_ls.setup({
    on_attach = lsp_zero.on_attach,
    capabilities = lsp_zero.get_capabilities(),
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'svelte',
        'jdtls'
    },
    handlers = {
        -- Default handler for all servers
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = lsp_zero.on_attach,
                capabilities = lsp_zero.get_capabilities(),
            })
        end,
        -- Skip lua_ls since we configured it above
        ['lua_ls'] = function() end,
    },
})

cmp.setup({
  sources = {
    -- This one provides the data from copilot.
    {name = 'copilot'},

    --- These are the default sources for lsp-zero
    {name = 'nvim_lsp'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'path'},
    {name = 'buffer', keyword_length = 3},
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  mapping = lsp_zero.defaults.cmp_mappings({
    ['<CR>'] = cmp.mapping.confirm({
      -- documentation says this is important.
      -- I don't know why.
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    })
  })
})

-- Looks of cmp window
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpItemAbbrMatch' })

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>vd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vn", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp_zero.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- move-analyzer for Sui
local lspconfig = require('lspconfig')
lspconfig.move_analyzer.setup({
    cmd = { os.getenv("HOME") .. "/.cargo/bin/move-analyzer" },
    filetypes = { "move" },
    root_dir = lspconfig.util.root_pattern("Move.toml", ".git"),
    -- Optional: add any additional settings you need
    on_attach = lsp_zero.on_attach, -- Use lsp-zero's on_attach if you have one
    capabilities = lsp_zero.get_capabilities(), -- Use lsp-zero's capabilities
})
