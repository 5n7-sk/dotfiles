local config = function()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {"go", "python"},
    highlight = {enable = true},
    indent = {enable = true}
  }
end

return {config = config}
