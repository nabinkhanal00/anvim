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
  [","] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },

  ["<space>"] = {"<cmd>Telescope find_files theme=get_dropdown hidden=true previewer=false<cr>", "Find files"},

  ["/"] = {"<cmd>Telescope live_grep theme=ivy<cr>", "Find Text"},

  ["."] = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },

  ["x"] = { "<cmd>bd!<CR>", "Buffer Delete" },
  ["w"] = { "<cmd>w!<CR>", "Save File" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["p"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },


d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    },
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
  u = {
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    "Undo Stage Hunk",
  },
  o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  d = {
    "<cmd>Gitsigns diffthis HEAD<cr>",
    "Diff",
  },
},

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>Telescope diagnostics<cr>",
      "Document Diagnostics",
    },
	f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
m = {
    name = "Make",
	g = {"<cmd>TermExec cmd=\"genmake\"<cr>", "Generate"},
	b = {"<cmd>TermExec cmd=\"make build\"<cr>", "Build"},
	r = {"<cmd>TermExec cmd=\"make run\"<cr>", "Run"},
	c = {"<cmd>TermExec cmd=\"make clean\"<cr>", "Clean"}
  }

}
wk.register(mappings, opts)
EOF
