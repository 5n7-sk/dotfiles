local map = require("utils").map

map("i", "jj", "<esc>")

map("n", "j", "gj")
map("n", "k", "gk")
map("n", "gj", "j")
map("n", "gk", "k")

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
