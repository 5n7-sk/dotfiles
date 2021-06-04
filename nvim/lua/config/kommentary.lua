local config = function()
  map = require("utils").map

  map("n", "<c-_>", "<Plug>kommentary_line_default", {noremap = false})
  map("v", "<c-_>", "<Plug>kommentary_visual_default", {noremap = false})
end

local setup = function()
  vim.g.kommentary_create_default_mappings = false
end

return {config = config, setup = setup}
