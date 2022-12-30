lua << EOF
require('telescope').setup{defaults={file_ignore_patterns={"vendor", ".git", "node_modules"}}}
require('telescope').load_extension("projects")
require('telescope').load_extension("ui-select")
EOF
