lua << EOF

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  open_on_setup_file = false,
  sort_by = "name",
  ignore_buffer_on_setup = false,
  ignore_ft_on_setup = {
	"startify",
	"dashboard",
	"alpha",
  },
  auto_reload_on_write = true,
  hijack_unnamed_buffer_when_opening = false,
  hijack_directories = {
	enable = true,
	auto_open = true,
  },
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  diagnostics = {
	enable = true,
	show_on_dirs = false,
	icons = {
	  hint = "",
	  info = "",
	  warning = "",
	  error = "",
	},
  },
  update_focused_file = {
	enable = true,
	update_cwd = true,
	ignore_list = {},
  },
  system_open = {
	cmd = nil,
	args = {},
  },
  git = {
	enable = true,
	ignore = false,
	timeout = 200,
  },
  view = {
	width = 30,
	height = 30,
	hide_root_folder = false,
	side = "right",
	preserve_window_proportions = false,
	mappings = {
	  custom_only = false,
	  list = {},
	},
	number = false,
	relativenumber = false,
	signcolumn = "yes",
  },
  renderer = {
	indent_markers = {
	  enable = false,
	  icons = {
		corner = "└ ",
		edge = "│ ",
		none = "  ",
	  },
	},
	icons = {
	  webdev_colors = true,
	  show = {
		git = true,
		folder = true,
		file = true,
		folder_arrow = true,
	  },
	  glyphs = {
		default = "",
		symlink = "",
		git = {
		  unstaged = "",
		  staged = "S",
		  unmerged = "",
		  renamed = "➜",
		  deleted = "",
		  untracked = "U",
		  ignored = "◌",
		},
		folder = {
		  default = "",
		  open = "",
		  empty = "",
		  empty_open = "",
		  symlink = "",
		},
	  },
	},
	highlight_git = true,
	root_folder_modifier = ":t",
  },
  filters = {
	dotfiles = true,
	custom = { "node_modules", "\\.cache" },
	exclude = {},
  },
  trash = {
	cmd = "trash",
	require_confirm = true,
  },
  log = {
	enable = false,
	truncate = false,
	types = {
	  all = false,
	  config = false,
	  copy_paste = false,
	  diagnostics = false,
	  git = false,
	  profile = false,
	},
  },
  actions = {
	use_system_clipboard = true,
	change_dir = {
	  enable = true,
	  global = false,
	  restrict_above_cwd = false,
	},
	open_file = {
	  quit_on_open = false,
	  resize_window = false,
	  window_picker = {
		enable = true,
		chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
		exclude = {
		  filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
		  buftype = { "nofile", "terminal", "help" },
		},
	  },
	},
  },
}

EOF
