local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)
lsp_zero.preset('recommended')
lsp_zero.setup()

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    ensure_installed = {
        "jdtls", -- java
        "tsserver", -- ts
        "pyright", -- python
        "lua_ls", -- lua
        "dockerls", -- docker
        "docker_compose_language_service", -- dockercompose
        "ltex",  -- latex
        "marksman" -- markdown
    },
    handlers = {
        function(name)
        lsp_zero.defaul_setup(name)
        local lsp = require('lspconfig')[name]
        print(name, type(lsp.manager))
    end,
    },
})
