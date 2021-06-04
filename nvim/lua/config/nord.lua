local setup = function()
  vim.api.nvim_command("colorscheme nord")
  vim.opt.termguicolors = true
end

return {setup = setup}
