local config = function()
  require("nvim-treesitter.configs").setup {rainbow = {enable = true}}
end

return {config = config}
