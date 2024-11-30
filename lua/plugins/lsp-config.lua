return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"dockerls",
					"docker_compose_language_service",
					"gopls",
					"html",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			--local on_attach = require("plugins.configs.lspconfig").on_attach
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

			-- Docker

			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})

			--Setup gopls

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			-- HTML

			--Enable (broadcasting) snippet capability for completion
			--local capabilities = vim.lsp.protocol.make_client_capabilities()
			--capabilities.textDocument.completion.completionItem.snippetSupport = true

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- HTMX

			--lspconfig.htmx.setup{}
		end,
	},
}
