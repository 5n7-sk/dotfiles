local map = require("utils").map

map("i", "<esc>", "<esc>l")
map("i", "jj", "<esc>l")

map("n", "j", "gj")
map("n", "k", "gk")
map("n", "gj", "j")
map("n", "gk", "k")

-- cursor behaivor for virtualedit
-- recuired: set virtualedit and whichwrap properly
function _G.smart_h()
  return string.len(vim.fn.getline(vim.fn.line(".") - 1)) > 0 and
           vim.fn.col(".") == 1 and "hl" or "h"
end
map("n", "h", "v:lua.smart_h()", {expr = true})

map("n", "$", "$l")

map("n", "sh", "<c-w>s")
map("n", "sv", "<c-w>v")

map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- resize windows
map("n", "<m-H>", "<cmd>vertical resize -10<cr>")
map("n", "<m-J>", "<cmd>resize +5<cr>")
map("n", "<m-K>", "<cmd>resize -5<cr>")
map("n", "<m-L>", "<cmd>vertical resize +10<cr>")

-- kill line without copying
map("n", "<m-k>", "\"_dd")

map("n", "<c-t>n", "<cmd>tabnew<cr>")

map("n", "<leader>q", "<cmd>q!<cr>")
map("n", "<leader>w", "<cmd>wa<cr>")

map("n", "<esc>", "<cmd>nohlsearch<cr>")
