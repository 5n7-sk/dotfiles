local setup = function()
  local map = require("utils").map

  map("n", "<leader>r", "<cmd>QuickRun<cr>")
end

return {setup = setup}
