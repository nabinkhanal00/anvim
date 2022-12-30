lua << EOF

require('bufferline').setup {
	options = {
		diagnostics =  "nvim_lsp" ,
		diagnostics_update_in_insert = false,

		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				-- highlight = "Directory"
				separator = true -- use a "true" to enable the default, or set your own character
			}
		},
		color_icons = true , -- whether or not to add the filetype icon highlights
		show_buffer_icons = true , -- disable filetype icons for buffers
	}
}
EOF
