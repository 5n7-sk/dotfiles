local config = function()
  require("telescope").load_extension("project")
end

local setup = function()
  local map = require("utils").map

  map("n", "<c-p>", "<cmd>Telescope project<cr>")
end

return {config = config, setup = setup}
