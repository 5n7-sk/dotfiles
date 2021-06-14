local setup = function()
  local map = require("utils").map

  map("n", "<leader>fb", "<cmd>DashboardJumpMarks<cr>")
  map("n", "<leader>tc", "<cmd>DashboardChangeColorscheme<cr>")
  map("n", "<leader>ff", "<cmd>DashboardFindFile<cr>")
  map("n", "<leader>fh", "<cmd>DashboardFindHistory<cr>")
  map("n", "<leader>fa", "<cmd>DashboardFindWord<cr>")
  map("n", "<leader>cn", "<cmd>DashboardNewFile<cr>")

  vim.g.dashboard_default_executive = "telescope"
end

return {setup = setup}
