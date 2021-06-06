local config = function()
  local bufmap = require("utils").bufmap
  local bufset = require("utils").bufset

  local on_attach = function(client, buffer)
    require("lsp_signature").on_attach()

    bufset(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")

    bufmap(buffer, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    bufmap(buffer, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    bufmap(buffer, "n", "<c-i>", "<cmd>lua vim.lsp.buf.hover()<cr>")
    bufmap(buffer, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    bufmap(buffer, "n", "<space>wl",
      "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>")
    bufmap(buffer, "n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
    bufmap(buffer, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    bufmap(buffer, "n", "<space>e",
      "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
  end

  local setup_servers = function()
    require("lspinstall").setup()

    local servers = require("lspinstall").installed_servers()
    for _, server in pairs(servers) do
      require("lspconfig")[server].setup({on_attach = on_attach})
    end
  end

  setup_servers()

  require("lspinstall").post_install_hook = function()
    setup_servers()
    vim.cmd("bufdo e")
  end
end

return {config = config}
