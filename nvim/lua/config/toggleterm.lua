local config = function()
  require("toggleterm").setup {open_mapping = "<c-j>", direction = "float"}
end

return {config = config}
