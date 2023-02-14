require("telescope").setup({
	defaults = { file_ignore_patterns = { "vendor", ".git", "node_modules", ".venv", "venv", "build", "__pycache__" } },
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	}
})
require("telescope").load_extension("projects")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("file_browser")
