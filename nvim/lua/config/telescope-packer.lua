local config = function()
  vim.cmd [[nnoremap <leader>pl :lua require('telescope').extensions.packer.plugins()<CR>]]
end

return {config = config}
