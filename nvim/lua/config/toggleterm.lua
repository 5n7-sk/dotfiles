local config = function()
  require("toggleterm").setup {open_mapping = "<c-t>t", direction = "float"}
end

return {config = config}
