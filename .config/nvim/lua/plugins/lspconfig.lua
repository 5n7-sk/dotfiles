local config = function()
  local bufmap = require("utils").bufmap
  local bufset = require("utils").bufset
  local installer = require("nvim-lsp-installer")

  local on_attach = function(_, buffer)
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

  local server_names = {
    "bashls",
    "dockerls",
    "efm",
    "gopls",
    "html",
    "jsonls",
    "pyright",
    "sumneko_lua",
    "terraformls",
    -- "texlab",
    "vimls",
    "yamlls"
  }

  for _, server_name in ipairs(server_names) do
    local ok, server = installer.get_server(server_name)
    if ok then
      if not server:is_installed() then
        server:install()
      end
    end
  end

  installer.on_server_ready(function(server)
    local opts = {on_attach = on_attach}

    if server.name == "efm" then
      opts.filetypes = {"python"}
      opts.settings = {
        languages = {
          python = {
            -- flake8
            {
              lintCommand = "poetry run flake8 --stdin-display-name ${INPUT} -",
              lintStdin = true,
              lintFormats = {"%f:%l%c: %m"}
            }
          }
        }
      }
    end

    if server.name == "pyright" then
      local python_path = ".venv/bin/python"
      if vim.fn.filereadable(python_path) then
        opts.settings = {python = {pythonPath = python_path}}
      end
    end

    server:setup(opts)
    vim.cmd("do User LspAttachBuffers")
  end)
end

return {config = config}
