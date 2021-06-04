local setup = function()
  local autocmd = require("utils").autocmd

  autocmd("BufWritePost", "plugins.lua PackerCompile")
end

return {setup = setup}
