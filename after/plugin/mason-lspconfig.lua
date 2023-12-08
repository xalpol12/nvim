require("mason-lspconfig").setup {
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
}
