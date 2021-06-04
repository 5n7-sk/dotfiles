local setup = function()
  local map = require("utils").map

  map("n", "<leader><cr>", "<cmd>HopWord<cr>", {silent = true})
end

return {setup = setup}
