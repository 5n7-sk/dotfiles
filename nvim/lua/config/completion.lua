local config = function()
  vim.api.nvim_command(
    [[autocmd BufEnter * lua require("completion").on_attach()]])

end

local setup = function()
  vim.api.nvim_command(
    [[inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"]])
  vim.api.nvim_command(
    [[inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"]])

  vim.opt.completeopt = {"menuone", "noinsert", "noselect"}
  vim.opt.shortmess:append({c = true})

  vim.g.completion_chain_complete_list = {
    default = {
      {complete_items = {"buffers", "lsp", "snippet", "tabnine", "ts"}}
    }
  }
  vim.g.completion_enable_snippet = "snippets.nvim"
  vim.g.completion_matching_strategy_list = {"exact", "substring"}
end

return {config = config, setup = setup}
