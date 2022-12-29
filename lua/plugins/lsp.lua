require("mason").setup()

require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup {}
	end,
}

require("mason-null-ls").setup({
    automatic_setup = true,
})

require('mason-null-ls').setup_handlers() 

require("null-ls").setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
					vim.lsp.buf.format({bufnr = bufnr})
                end,
            })
        end
    end,
})


require("mason-nvim-dap").setup({
    automatic_setup = true,
})

require("mason-nvim-dap").setup_handlers()
