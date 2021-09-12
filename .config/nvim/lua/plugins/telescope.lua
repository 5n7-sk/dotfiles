local config = function()
  require("telescope").setup {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--column",
        "--glob=!.git/**",
        "--hidden",
        "--line-number",
        "--no-heading",
        "--smart-case",
        "--with-filename"
      }
    }
  }
end

local setup = function()
  local map = require("utils").map
  map("n", "<c-p>", "<cmd>Telescope commands<cr>")
  map("n", "<leader>ff", "<cmd>Telescope find_files find_command=rg,--files,--glob=!.git/**,--hidden,--no-ignore<cr>")
  map("n", "<leader>lg", "<cmd>Telescope live_grep<cr>")
  map("n", "<c-m>", "<cmd>Telescope lsp_workspace_diagnostics<cr>")
end

return {config = config, setup = setup}
