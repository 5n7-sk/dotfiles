local config = function()
  require("compe").setup {
    source = {
      -- common
      buffer = true,
      calc = true,
      omni = false,
      path = true,
      spell = true,
      tags = true,
      -- Neovim-specific
      nvim_lua = true,
      nvim_lsp = true,
      -- plugins/sources
      ultisnips = true,
      tabnine = true
    }
  }

  local map = require("utils").map
  map("i", "<c-space>", "compe#complete()", {expr = true})
  map("i", "<cr>", "compe#confirm('<cr>')", {expr = true})
  map("i", "<c-e>", "compe#confirm('<c-e>')", {expr = true})
end

return {config = config}
