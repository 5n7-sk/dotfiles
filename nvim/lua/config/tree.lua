local setup = function()
  local map = require("utils").map

  map("n", "<c-b>", "<cmd>NvimTreeToggle<cr>")

  vim.g.nvim_tree_width = 40
end

return {setup = setup}
