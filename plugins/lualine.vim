lua <<EOF
local gps = require("nvim-gps")
gps.setup()
require("lualine").setup{
options = {
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
	lualine_c = {{'filename'}, {gps.get_location, cond = gps.is_available}},
    lualine_x = {{'diagnostics', sources={'nvim_diagnostic', 'coc'}}},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
	lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'nvim-tree'},
  theme='edge'
}
EOF
