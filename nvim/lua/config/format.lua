local config = function()
  local autocmd = require("utils").autocmd

  autocmd("Format", "BufWritePost * FormatWrite", true)

  require("format").setup {
    ["*"] = {{cmd = {"sed -i 's/[ \t]*$//'"}}},
    go = {{cmd = {"goimports -w"}}},
    python = {{cmd = {"black --quiet", "isort"}}}
  }
end

return {config = config}
