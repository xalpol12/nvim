local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',
        'clangd',
        'docker_compose_language_service',
        'dockerls',
        'jdtls',
        'lua_ls',
        'marksman',
        'pyright',
        'tsserver',
        'eslint',
        'html',
        'cssls'
    },
    handlers = {
        lsp_zero.default_setup,
    },
})
