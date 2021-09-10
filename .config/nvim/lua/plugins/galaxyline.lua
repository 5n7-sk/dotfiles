local config = function()
  local cond = require("galaxyline.condition")
  local gl = require("galaxyline")
  local gps = require("nvim-gps")
  local fileinfo = require("galaxyline.provider_fileinfo")

  local gls = gl.section
  gl.short_line_list = {"NvimTree", "packer"}

  local colors = {
    bg = "#444444",
    fg = "#a89984",
    section_bg = "#38393f",
    yellow = "#d79921",
    cyan = "#83a598",
    green = "#b8bb26",
    orange = "#fe8019",
    purple = "#b16286",
    magenta = "#d3869b",
    blue = "#83a598",
    red = "#fb4934"
  }

  -- workaround to fill mid
  -- vim.cmd [[:hi StatusLine guifg=#282828]]

  local provider_space = function()
    return " "
  end

  local mode_colors = function(mode)
    local _mode_colors = {
      n = colors.blue,
      i = colors.green,
      c = colors.orange,
      v = colors.magenta,
      V = colors.purple,
      [""] = colors.magenta,
      R = colors.red,
      s = colors.red,
      t = colors.red
    }

    local color = _mode_colors[mode]
    return color and color or colors.blue
  end

  local mode_names = function(mode)
    local _mode_names = {
      n = "NORMAL",
      i = "INSERT",
      c = "COMMAND",
      v = "VISUAL",
      V = "V-LINE",
      [""] = "V-BLOCK",
      R = "REPLACE",
      s = "SELECT",
      t = "TERMINAL"
    }

    local name = _mode_names[mode]
    return name and name or "UNKNOWN"
  end

  gls.left = {
    {Start = {provider = provider_space}},
    {
      ViMode = {
        provider = function()
          local mode = vim.fn.mode()
          vim.cmd("hi GalaxyViMode guifg=" .. mode_colors(mode))
          return " " .. mode_names(mode) .. " "
        end
      }
    },
    {FileIcon = {provider = "FileIcon", condition = cond.buffer_not_empty}},
    {FileName = {provider = "FileName", condition = cond.buffer_not_empty}},
    {DiagnosticError = {provider = "DiagnosticError", icon = " "}},
    {DiagnosticWarn = {provider = "DiagnosticWarn", icon = " "}},
    {DiagnosticHint = {provider = "DiagnosticHint", icon = " "}},
    {DiagnosticInfo = {provider = "DiagnosticInfo", icon = " "}},
    {
      ShowLspClient = {
        provider = function()
          return require("galaxyline.provider_lsp").get_lsp_client("")
        end
      }
    }
  }

  gls.mid = {
    {
      NvimGps = {
        provider = function()
          return gps.get_location()
        end,
        condition = function()
          return gps.is_available()
        end
      }
    }
  }

  gls.right = {
    {
      GitIcon = {
        provider = function()
          return "  "
        end,
        condition = cond.check_git_workspace
      }
    },
    {GitBranch = {provider = "GitBranch", condition = cond.check_git_workspace}},
    {DiffAdd = {provider = "DiffAdd", condition = cond.check_git_workspace, icon = "   "}},
    {DiffModified = {provider = "DiffModified", condition = cond.checkwidth, icon = " 柳"}},
    {DiffRemove = {provider = "DiffRemove", condition = cond.checkwidth, icon = "  "}},
    {BufferType = {provider = "FileTypeName", separator = " "}},
    {LineInfo = {provider = "LineColumn", separator = " "}}
  }

  gls.short_line_left = {
    {BufferType = {provider = {provider_space, "FileTypeName"}, separator = " "}},
    {
      SFileName = {
        provider = function()
          local fileinfo = require("galaxyline.provider_fileinfo")
          local fname = fileinfo.get_current_file_name()
          for _, v in ipairs(gl.short_line_list) do
            if v == vim.bo.filetype then
              return ""
            end
          end
          return fname
        end,
        condition = cond.buffer_not_empty
      }
    }
  }

  gls.short_line_right = {
    {
      BufferIcon = {
        provider = {
          function()
            local icon = {NvimTree = "", packer = ""}
            return icon[vim.bo.filetype]
          end,
          provider_space
        }
      }
    }
  }
end

return {config = config}
