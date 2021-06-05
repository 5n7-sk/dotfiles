local map = require("utils").map

map("i", "jj", "<esc>")

map("n", "j", "gj")
map("n", "k", "gk")
map("n", "gj", "j")
map("n", "gk", "k")

map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

map("n", "sh", "<c-w>s")
map("n", "sv", "<c-w>v")

map("n", "<c-t>n", "<cmd>tabnew<cr>")
map("n", "<c-t>h", "<cmd>tabprevious<cr>")
map("n", "<c-t>l", "<cmd>tabnext<cr>")

map("n", "<leader>q", "<cmd>q!<cr>")
map("n", "<leader>w", "<cmd>wa<cr>")

map("n", "<esc>", "<cmd>nohlsearch<cr>")
