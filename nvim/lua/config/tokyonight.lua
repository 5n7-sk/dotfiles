local config = function()
  vim.g.tokyonight_italic_keywords = false
  vim.g.tokyonight_style = "night"

  vim.opt.termguicolors = true
  vim.api.nvim_command("colorscheme tokyonight")
end

return {config = config}
