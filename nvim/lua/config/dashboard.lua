local setup = function()
  local map = require("utils").map

  map("n", "<leader>cn", "<cmd>DashboardNewFile<cr>")

  vim.g.dashboard_default_executive = "telescope"
end

return {setup = setup}
