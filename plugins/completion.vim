lua << EOF

  -- Setup nvim-cmp.
local cmp = require'cmp'

local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
--completion = {
  --autocomplete = true
  --},
  snippet = {
	  -- REQUIRED - you must specify a snippet engine
	  expand = function(args)
	  vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	  -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	  -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	  -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
	  end,
  },
  mapping = {
	  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
	  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
	  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	  ['<Tab>'] = function(fallback)
	  if cmp.visible() then
		  cmp.select_next_item()
	  else
		  fallback()
		  end
		  end,
		  ['<S-Tab>'] = function(fallback)
		  if cmp.visible() then
			  cmp.select_prev_item()
		  else
			  fallback()
			  end
			  end,
			  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			  ['<C-e>'] = cmp.mapping({
			  i = cmp.mapping.abort(),
			  c = cmp.mapping.close(),
			  }),
			  ['<CR>'] = cmp.mapping.confirm({ select = false }),
  },
  formatting = {

	  fields = { "kind", "abbr", "menu" },
	  format = function(entry, vim_item)
	  -- Kind icons
	  vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
	  -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
	  vim_item.menu = ({
	  nvim_lsp = "[LSP]",
	  luasnip = "[Snippet]",
	  buffer = "[Buffer]",
	  path = "[Path]",
	  })[entry.source.name]
	  return vim_item
	  end,
  },
  sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' },
  }, {
	  { name = 'buffer' },
  })
  })
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
	function (server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
	end,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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

require("mason-null-ls").setup({
    automatic_setup = true,
})

require('mason-null-ls').setup_handlers() 

require("mason-nvim-dap").setup({
    automatic_setup = true,
})

require("mason-nvim-dap").setup_handlers()

require("nvim-dap-virtual-text").setup()
require("dapui").setup()
require('telescope').load_extension('dap')

require("noice").setup()

local dap_breakpoint = {
  error = {
    text = "🟥",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  rejected = {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
  },
  stopped = {
    text = "⭐️",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

-- lvim.lsp.on_attach_callback = function
EOF
let g:vsnip_snippet_dir="/home/nabin/.config/nvim/snippets"
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
