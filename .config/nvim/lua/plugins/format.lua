local M = {}

M.config = function()
  local autocmd = require("utils").autocmd
  autocmd("Format", "BufWritePost * FormatWrite", true)

  require("format").setup {
    ["*"] = {{cmd = {"sed -i 's/[ \t]*$//'"}}},
    bash = {{cmd = {"shfmt -i 2 -w"}}},
    javascript = {{cmd = {"prettier -w"}}},
    json = {{cmd = {"prettier -w"}}},
    go = {{cmd = {"goimports -w"}}},
    lua = {{cmd = {"lua-format -i"}}},
    markdown = {{cmd = {"prettier -w"}}},
    python = {{cmd = {"black", "isort -m 3"}}},
    sh = {{cmd = {"shfmt -i 2 -w"}}},
    terraform = {{cmd = {"terraform fmt -write"}}},
    typescript = {{cmd = {"prettier -w"}}},
    yaml = {{cmd = {"prettier -w"}}},
    zsh = {{cmd = {"shfmt -i 2 -w"}}}
  }
end

return M
