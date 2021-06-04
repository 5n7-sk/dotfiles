local setup = function()
  local map = require("utils").map

  map("n", "<c-b>", "<cmd>NvimTreeToggle<cr>")
end

return {setup = setup}
