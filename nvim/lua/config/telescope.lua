local setup = function()
  local map = require("utils").map

  map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {silent = true})
  map("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", {silent = true})
end

return {setup = setup}
