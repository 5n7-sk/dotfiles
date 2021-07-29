local config = function()
  require("compe").setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
      border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 120,
      min_width = 60,
      max_height = math.floor(vim.o.lines * 0.3),
      min_height = 1
    },

    source = {
      buffer = true,
      calc = true,
      omni = false,
      path = true,
      spell = true,
      tags = true,

      nvim_lua = true,
      nvim_lsp = true,

      ultisnips = true,

      tabnine = true
    }
  }

  vim.cmd([[
            inoremap <silent><expr> <c-space> compe#complete()
            inoremap <silent><expr> <cr>      compe#confirm("<cr>")
            inoremap <silent><expr> <c-e>     compe#close("<c-e>")
          ]])
end

return {config = config}
