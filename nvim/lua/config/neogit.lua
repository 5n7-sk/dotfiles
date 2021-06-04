local setup = function()
  local map = require("utils").map

  map("n", "<leader>gc", "<cmd>Neogit commit<cr>")
end

return {setup = setup}
