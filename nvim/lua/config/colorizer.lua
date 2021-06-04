local config = function()
  vim.opt.termguicolors = true

  require("colorizer").setup()
end

return {config = config}
