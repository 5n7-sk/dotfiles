local config = function()
  require("telescope").load_extension("vim_bookmarks")
end

local setup = function()
  local map = require("utils").map

  map("n", "<leader>bm", "<cmd>Telescope vim_bookmarks all<cr>")
end

return {config = config, setup = setup}
