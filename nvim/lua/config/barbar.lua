local setup = function()
  local map = require("utils").map

  map("n", "<a-,>", "<cmd>BufferPrevious<cr>")
  map("n", "<a-.>", "<cmd>BufferNext<cr>")

  map("n", "<a-<>", "<cmd>BufferMovePrevious<cr>")
  map("n", "<a->>", "<cmd>BufferMoveNext<cr>")

  map("n", "<a-1>", "<cmd>BufferGoto 1<cr>")
  map("n", "<a-2>", "<cmd>BufferGoto 2<cr>")
  map("n", "<a-3>", "<cmd>BufferGoto 3<cr>")
  map("n", "<a-4>", "<cmd>BufferGoto 4<cr>")
  map("n", "<a-5>", "<cmd>BufferGoto 5<cr>")
  map("n", "<a-6>", "<cmd>BufferGoto 6<cr>")
  map("n", "<a-7>", "<cmd>BufferGoto 7<cr>")
  map("n", "<a-8>", "<cmd>BufferGoto 8<cr>")
  map("n", "<a-9>", "<cmd>BufferGoto 9<cr>")

  map("n", "<a-w>", "<cmd>BufferClose<cr>")
  map("n", "<a-s>", "<cmd>BufferPick<cr>")

  map("n", "<leader>bd", "<cmd>BufferOrderByDirectory<cr>")
  map("n", "<leader>bl", "<cmd>BufferOrderByLanguage<cr>")

end

return {setup = setup}
