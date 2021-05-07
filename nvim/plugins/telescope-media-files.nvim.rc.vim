lua << EOF
require("telescope").load_extension("media_files")
EOF

nnoremap <leader>fm <cmd>lua require("telescope").extensions.media_files.media_files()<cr>
