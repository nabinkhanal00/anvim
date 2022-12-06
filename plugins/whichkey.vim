lua << EOF
local wk = require("which-key")
wk.setup{
plugins = {
	marks = true, -- shows a list of your marks on ' and `
	registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
	spelling = {
		enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
		suggestions = 20, -- how many suggestions should be shown in the list?
		},
	-- the presets plugin, adds help for a bunch of default keybindings in Neovim
	-- No actual key bindings are created
	presets = {
		operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
		motions = true, -- adds help for motions
		text_objects = true, -- help for text objects triggered after entering an operator
		windows = true, -- default bindings on <c-w>
		nav = true, -- misc bindings to work with windows
		z = true, -- bindings for folds, spelling and others prefixed with z
		g = true, -- bindings for prefixed with g
		},
	},
-- add operators that will trigger motion and text object completion
-- to enable all native operators, set the preset / operators plugin above
operators = { gc = "Comments" },
key_labels = {
	-- override the label used to display some keys. It doesn't effect WK in any other way.
	-- For example:
	-- ["<space>"] = "SPC",
	-- ["<cr>"] = "RET",
	-- ["<tab>"] = "TAB",
	},
icons = {
	breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
	separator = "➜", -- symbol used between a key and it's label
	group = "+", -- symbol prepended to a group
	},
popup_mappings = {
	scroll_down = '<c-d>', -- binding to scroll down inside the popup
	scroll_up = '<c-u>', -- binding to scroll up inside the popup
	},
window = {
	border = "none", -- none, single, double, shadow
	position = "bottom", -- bottom, top
	margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
	padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	winblend = 0
	},
layout = {
	height = { min = 4, max = 25 }, -- min and max height of the columns
	width = { min = 20, max = 50 }, -- min and max width of the columns
	spacing = 3, -- spacing between columns
	align = "left", -- align columns left, center or right
	},
ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
show_help = true, -- show help message on the command line when the popup is visible
triggers = "auto", -- automatically setup triggers
-- triggers = {"<leader>"} -- or specify a list manually
triggers_blacklist = {
	-- list of mode / prefixes that should never be hooked by WhichKey
	-- this is mostly relevant for key maps that start with a native binding
	-- most people should not need to change this
	i = { "j", "k" },
	v = { "j", "k" },
	},
}
local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
	}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["<space>"] = {"<cmd>Telescope find_files <cr>", "Find Files"},
	["/"] = {"<cmd>Telescope live_grep <cr>", "Find Text"},
	["."] = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },
	["s"] = { "<cmd>w!<CR>", "Save File" },
	["q"] = { "<cmd>q!<CR>", "Quit Neovim" },
	[";"] = { "<cmd>source $MYVIMRC<CR>", "Reload nvim" },

	g = {
		name = "Git",
		g = { "<cmd>LazyGit<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>","Undo Stage Hunk"},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {"<cmd>Gitsigns diffthis HEAD<cr>","Diff"},
		},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {"<cmd>Telescope diagnostics<cr>","Document Diagnostics"},
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format"},
		i = { "<cmd>LspInfo<cr>", "Info"},
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {"<cmd>lua vim.diagnostic.goto_next()<CR>","Next Diagnostic"},
		k = {"<cmd>lua vim.diagnostic.goto_prev()<cr>","Prev Diagnostic"},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
		S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>","Workspace Symbols"},
		},

	c = {
		name = "Code",
		h = { "<cmd>nohlsearch<CR>", "No Highlight" },
		p = {
			name = "Competitive Programming",
			r = {"<cmd>CphReceive<cr>", "Receive"},
			t = {"<cmd>CphTest<cr>", "Test"},
			e = {"<cmd>CphEdit<cr>", "Edit"},
			d = {"<cmd>CphDelete<cr>", "Delete"},
			},
		["/"] = {"gcc", "Comment"},
		},
	r = {"<cmd><cr>", "Run"},
	b = {
		name = "Buffers",
		d = { "<cmd>BufferClose<cr>", "Delete" },
		D = { "<cmd>BufferCloseAllButCurrentOrPinned<cr>", "Delete Other" },
		p = { "<cmd>BufferPin<cr>", "Pin" },
		l = {"<cmd>BufferNext<cr>", "Right"},
		L = {"<cmd>BufferCloseBuffersRight<cr>", "Delete Right"},
		H = {"<cmd>BufferCloseBuffersLeft<cr>", "Delete Left"},
		h = {"<cmd>BufferPrevious<cr>", "Left"},
		b = {"<cmd>lua require('telescope.builtin').buffers()<cr>","List"},
		},

	w = {
		name = "Window",
		l = {"<C-w>l", "Right"},
		h = {"<C-w>h", "Left"},
		j = {"<C-w>j", "Down"},
		k = {"<C-w>k", "Up"},
		["|"] = {"<C-w>|", "Full Window"},
		v = {"<C-w>v", "Split Right"},
		s = {"<C-w>s", "Split Down"},
		L = {"<C-w>5>", "Expand Right"},
		["."] = {"<C-w>5>", "Expand Right"},
		H = {"<C-w>5<", "Expand Left"},
		[","] = {"<C-w>5<", "Expand Left"},
		J = {"<cmd>resize +5<cr>", "Expand Down"},
		K = {"<cmd>resize -5<cr>", "Expand Up"},
		q = {"<C-w>q", "Quit Window"},
		w = {"<C-w>s", "Switch Window"},
		x = {"<C-w>x", "Swap Window"},
		["="] = {"<C-w>=", "Balance Window"}
		},

	p = {
		name = "Projects",
		p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "list" },
		},
	f = {
		name = "Find",
		f = {"<cmd>lua require('telescope.builtin').find_files()<cr>","Files"},
		F = {"<cmd>lua require('telescope.builtin').find_files{ hidden=true, no_ignore=true }<cr>","All Files"},
		b = {"<cmd>lua require('telescope.builtin').buffers()<cr>","Buffers"},
		h = {"<cmd>lua require('telescope.builtin').help_tags()<cr>","Help Tags"},
		r = {"<cmd>lua require('telescope.builtin').registers()<cr>","Registers"},
		m = {"<cmd>lua require('telescope.builtin').marks()","Marks"},
		o = {"<cmd>lua require('telescope.builtin').oldfiles()<cr>","Old Files"},
		c = {"<cmd>lua require('telescope.builtin').grep_string()<cr>","Search Word Under Cursor"},
		t = {"<cmd>lua require('telescope.builtin').live_grep()<cr>","Search Text"},
		C = {"<cmd>lua require('telescope.builtin').colorscheme()<cr>","Colorschemes"},
		p = {"<cmd>lua require('telescope.builtin').colorscheme{enable_preview=true}<cr>","Preview Colorscheme"},
		}
	}
wk.register(mappings, opts)
EOF
