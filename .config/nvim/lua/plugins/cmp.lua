local config = function()
  local cmp = require("cmp")

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

        vim_item.menu = ({
          buffer = "[Buffer]",
          calc = "[Calc]",
          cmp_tabnine = "[Tabnine]",
          emoji = "[Emoji]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          path = "[Path]",
          ultisnips = "[UltiSnips]"
        })[entry.source.name]

        return vim_item
      end
    },
    mapping = {
      ["<c-k>"] = cmp.mapping.select_prev_item(),
      ["<c-j>"] = cmp.mapping.select_next_item(),
      ["<c-u>"] = cmp.mapping.scroll_docs(-5),
      ["<c-d>"] = cmp.mapping.scroll_docs(5),
      ["<c-space>"] = cmp.mapping.complete(),
      ["<c-e>"] = cmp.mapping.close(),
      ["<cr>"] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace, select = true}
    },
    sources = {
      {name = "buffer"},
      {name = "calc"},
      {name = "cmp_tabnine"},
      {name = "emoji"},
      {name = "nvim_lsp"},
      {name = "nvim_lua"},
      {name = "path"},
      {name = "ultisnips"}
    }
  }
end

return {config = config}
