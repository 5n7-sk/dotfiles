local M = {}

M.config = function()
  local cb = require("nvim-tree.config").nvim_tree_callback

  require("nvim-tree").setup {
    lsp_diagnostics = true,
    view = {
      width = 40,
      mappings = {
        custom_only = true,
        list = {
          {key = {"<cr>"}, cb = cb("edit")},
          {key = {"l"}, cb = cb("cd")},
          {key = {"<c-v>"}, cb = cb("vsplit")},
          {key = {"<c-x>"}, cb = cb("split")},
          {key = {"<c-t>"}, cb = cb("tabnew")},
          {key = {"<"}, cb = cb("prev_sibling")},
          {key = {">"}, cb = cb("next_sibling")},
          {key = {"P"}, cb = cb("parent_node")},
          {key = {"<bs>"}, cb = cb("close_node")},
          {key = {"<s-cr>"}, cb = cb("close_node")},
          {key = {"<tab>"}, cb = cb("preview")},
          {key = {"K"}, cb = cb("first_sibling")},
          {key = {"J"}, cb = cb("last_sibling")},
          {key = {"I"}, cb = cb("toggle_ignored")},
          {key = {"H"}, cb = cb("toggle_dotfiles")},
          {key = {"R"}, cb = cb("refresh")},
          {key = {"a"}, cb = cb("create")},
          {key = {"d"}, cb = cb("remove")},
          {key = {"r", "<f2>"}, cb = cb("rename")},
          {key = {"<c-r>"}, cb = cb("full_rename")},
          {key = {"x"}, cb = cb("cut")},
          {key = {"c"}, cb = cb("copy")},
          {key = {"p"}, cb = cb("paste")},
          {key = {"y"}, cb = cb("copy_name")},
          {key = {"Y"}, cb = cb("copy_path")},
          {key = {"gy"}, cb = cb("copy_absolute_path")},
          {key = {"[c}"}, cb = cb("prev_git_item")},
          {key = {"]c}"}, cb = cb("next_git_item")},
          {key = {"h"}, cb = cb("dir_up")},
          {key = {"o"}, cb = cb("system_open")},
          {key = {"q"}, cb = cb("close")},
          {key = {"g?"}, cb = cb("toggle_help")}
        }
      }
    }
  }
end

M.setup = function()
  local map = require("utils").map
  map("n", "<c-b>", "<cmd>NvimTreeToggle<cr>")

  vim.g.nvim_tree_ignore = {"__pycache__"}
end

return M
