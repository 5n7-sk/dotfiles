-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/sk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sk/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sk/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["chowcho.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/chowcho.nvim"
  },
  ["cmd-parser.nvim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/cmd-parser.nvim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdiffview\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["format.nvim"] = {
    config = { "\27LJ\2\n‚\2\0\0\a\0\21\0(6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0+\5\2\0B\1\4\0016\1\0\0'\3\5\0B\1\2\0029\1\6\0015\3\n\0004\4\3\0005\5\b\0005\6\a\0=\6\t\5>\5\1\4=\4\v\0034\4\3\0005\5\r\0005\6\f\0=\6\t\5>\5\1\4=\4\14\0034\4\3\0005\5\16\0005\6\15\0=\6\t\5>\5\1\4=\4\17\0034\4\3\0005\5\19\0005\6\18\0=\6\t\5>\5\1\4=\4\20\3B\1\2\1K\0\1\0\vpython\1\0\0\1\3\0\0\18black --quiet\nisort\blua\1\0\0\1\2\0\0\18lua-format -i\ago\1\0\0\1\2\0\0\17goimports -w\6*\1\0\0\bcmd\1\0\0\1\2\0\0\24sed -i 's/[ \t]*$//'\nsetup\vformat\31BufWritePost * FormatWrite\vFormat\fautocmd\nutils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/format.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\b\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2H\0\1\4\0\3\1\f6\1\0\0009\1\1\0019\1\2\1)\3\0\0B\1\2\2\25\1\0\1\0\0\1\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\rwinwidth\afn\bvim\4\25\0\0\2\1\0\0\4-\0\0\0B\0\1\2\19\0\0\0L\0\2\0\1¿|\0\2\v\1\2\0\26+\2\1\0)\3\1\0\21\4\0\0)\5\1\0M\3\20Ä6\a\0\0008\t\6\0B\a\2\2\a\a\1\0X\a\tÄ-\a\0\0008\t\6\0\18\n\1\0B\a\3\2\18\2\a\0\15\0\2\0X\a\aÄX\3\aÄX\a\5Ä8\a\6\0\5\a\1\0X\a\2Ä+\a\2\0L\a\2\0O\3ÏL\2\2\0\a¿\ntable\ttypea\0\0\4\3\4\0\r-\0\0\0B\0\1\2\15\0\0\0X\1\bÄ-\0\1\0-\2\2\0009\2\0\0026\3\1\0009\3\2\0039\3\3\3B\0\3\2\19\0\0\0L\0\2\0\6¿\a¿\0¿\rfiletype\abo\bvim\20short_line_list+\0\0\3\2\0\0\b-\0\0\0)\2(\0B\0\2\2\15\0\0\0X\1\2Ä-\0\1\0B\0\1\2L\0\2\0\2¿\6¿à\2\0\0\5\1\17\00015\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\0\1=\1\5\0-\1\0\0009\1\6\1=\1\a\0-\1\0\0009\1\6\1=\1\b\0-\1\0\0009\1\6\1=\1\t\0-\1\0\0009\1\n\1=\1\v\0-\1\0\0009\1\3\1=\1\f\0006\1\r\0009\1\14\0019\1\15\1B\1\1\0028\1\1\0\n\1\0\0X\1\aÄ6\1\r\0009\1\14\0019\1\15\1B\1\1\0028\1\1\0L\1\2\0X\1\tÄ6\1\16\0006\3\r\0009\3\14\0039\3\15\3B\3\1\0A\1\0\1-\1\0\0009\1\6\1L\1\2\0K\0\1\0\5¿\nprint\tmode\afn\bvim\6t\6R\tred1\6v\5\6V\vpurple\6c\6i\tblue\6n\1\0\0\ngreenl\0\0\1\0\a\0\0166\0\0\0009\0\1\0009\0\2\0\a\0\3\0X\0\2Ä'\0\4\0L\0\2\0006\0\0\0009\0\1\0009\0\5\0\v\0\2\0X\0\2Ä'\0\6\0L\0\2\0'\0\4\0L\0\2\0\n ÔÅó \rreadonly\5\thelp\rfiletype\abo\bvimß\3\0\0\5\1\14\2-6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\0026\1\0\0009\1\4\0019\1\5\1\18\3\0\0B\1\2\2\t\1\0\0X\1\2Ä'\1\6\0L\1\2\0006\1\a\0009\1\b\1-\3\0\0B\3\1\0A\1\0\2\b\1\1\0X\1\5Ä\18\1\0\0-\2\0\0B\2\1\2&\1\2\1L\1\2\0006\1\0\0009\1\t\0019\1\n\1\15\0\1\0X\2\tÄ6\1\0\0009\1\t\0019\1\v\1\15\0\1\0X\2\4Ä\18\1\0\0'\2\f\0&\1\2\1L\1\2\0\18\1\0\0'\2\r\0&\1\2\1L\1\2\0\v¿\6 \n ÔÅÄ \rmodified\15modifiable\abo\blen\vstring\5\nempty\afn•\1    if winwidth(0) < 50\n      echo expand('%:t')\n    elseif winwidth(0) > 150\n      echo expand('%')\n    else\n      echo pathshorten(expand('%'))\n    endif\n    \14nvim_exec\bapi\bvim\2\0q\0\0\4\3\4\0\17-\0\0\0-\2\1\0009\2\0\0026\3\1\0009\3\2\0039\3\3\3B\0\3\2\15\0\0\0X\1\5Ä6\0\1\0009\0\2\0009\0\3\0L\0\2\0X\0\2Ä-\0\2\0D\0\1\0K\0\1\0\a¿\0¿\f¿\rfiletype\abo\bvim\20short_line_listØ\1\0\1\n\0\t\0\27'\1\0\0007\1\1\0006\1\2\0009\1\3\1\18\3\0\0'\4\4\0B\1\3\4X\4\15Ä6\5\2\0009\5\5\5\18\a\4\0'\b\6\0)\t\0\0B\5\4\0027\5\a\0006\5\a\0\14\0\5\0X\5\5Ä6\5\1\0'\6\b\0\18\a\4\0&\5\a\0057\5\1\0E\4\3\2R\4Ô6\1\1\0L\1\2\0\6 \rerr_warn\r^[WE]%d+\tfind\v[^%s]+\vgmatch\vstring\17shorter_stat\5P\0\0\4\1\4\0\r6\0\0\0009\0\1\0009\0\2\0B\0\1\2\15\0\0\0X\1\2Ä\a\0\3\0X\1\2Ä'\1\3\0L\1\2\0-\1\0\0\18\3\0\0D\1\2\0\14¿\5\15coc#status\afn\bvim[\0\0\3\1\5\1\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\t\0\0\0X\0\2Ä-\0\0\0D\0\1\0'\0\4\0L\0\2\0\15¿\5\26*coc#rpc#start_server\vexists\afn\bvim\2g\0\0\5\0\5\0\v6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\3\0\0'\4\4\0B\0\4\3\14\0\0\0X\2\1ÄK\0\1\0L\1\2\0\25coc_current_function\21nvim_buf_get_var\bapi\bvim\npcall[\0\0\3\1\5\1\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\t\0\0\0X\0\2Ä-\0\0\0D\0\1\0'\0\4\0L\0\2\0\17¿\5\26*coc#rpc#start_server\vexists\afn\bvim\2°\2\0\0\6\1\n\0\0295\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0-\4\0\0B\4\1\2&\3\4\3B\1\2\0016\1\1\0009\1\5\0019\1\6\1B\1\1\0028\1\1\0\n\1\0\0X\1\nÄ'\1\a\0006\2\1\0009\2\5\0029\2\6\2B\2\1\0028\2\2\0'\3\b\0&\1\3\1L\1\2\0X\1\2Ä'\1\t\0L\1\2\0K\0\1\0\n¿\15  V-BLOCK \6 \a  \tmode\afn\27hi GalaxyViMode guibg=\17nvim_command\bapi\bvim\1\0\n\6R\fREPLACE\6S\vS-LINE\6s\vSELECT\6n\vNORMAL\6V\vV-LINE\6v\vVISUAL\6i\vINSERT\6c\fCOMMAND\6t\rTERMINAL\5\vVISUAL\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 à\1\0\0\4\0\b\1\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\b\0\0\0X\0\2Ä'\0\4\0L\0\2\0006\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\a\0D\0\3\0\19coc_git_status\21nvim_buf_get_var\bapi\5\21b:coc_git_status\vexists\afn\bvim\2ä\1\0\0\4\0\b\1\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\b\0\0\0X\0\2Ä'\0\4\0L\0\2\0006\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\a\0D\0\3\0\20gitsigns_status\21nvim_buf_get_var\bapi\5\22b:gitsigns_status\vexists\afn\bvim\2S\0\0\5\1\4\0\r-\0\0\0B\0\1\0026\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\2\v\1\0\0X\2\2Ä'\2\3\0X\3\1Ä\18\2\1\0L\2\2\0\20¿\5\f%+(%d+)\nmatch\vstringR\0\0\5\1\4\0\r-\0\0\0B\0\1\0026\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\2\v\1\0\0X\2\2Ä'\2\3\0X\3\1Ä\18\2\1\0L\2\2\0\20¿\5\v~(%d+)\nmatch\vstringS\0\0\5\1\4\0\r-\0\0\0B\0\1\0026\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\2\v\1\0\0X\2\2Ä'\2\3\0X\3\1Ä\18\2\1\0L\2\2\0\20¿\5\f%-(%d+)\nmatch\vstring'\0\1\5\0\2\0\4\18\3\0\0009\1\0\0'\4\1\0D\1\3\0\14^.+/(.+)$\nmatchà\1\0\0\6\1\6\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\14\0\0\0X\1\2Ä'\1\3\0L\1\2\0\18\3\0\0009\1\4\0'\4\5\0'\5\3\0B\1\4\2-\2\0\0\18\4\1\0D\2\2\0\24¿\r/.git/?$\tgsub\5\16get_git_dir\28galaxyline.provider_vcs\frequireÉ\1\0\0\6\0\a\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\14\0\0\0X\1\2Ä'\1\3\0L\1\2\0006\1\4\0009\1\5\1\18\3\0\0'\4\6\0'\5\3\0D\1\4\0\b%s+\tgsub\vstring\5\19get_git_branch\28galaxyline.provider_vcs\frequire\17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\tÔû° \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 Ñ\1\0\0\2\4\3\0\19-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0-\1\2\0\5\0\1\0X\0\4Ä-\0\1\0-\1\3\0=\1\1\0X\0\3Ä-\0\1\0-\1\2\0=\1\1\0-\0\0\0009\0\2\0B\0\1\1K\0\1\0\0¿\3¿\27¿\28¿\20load_galaxyline\nright\23disable_galaxyline\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  ´\27\1\0$\0™\1\0ÿ\0036\0\0\0'\2\1\0B\0\2\0023\1\2\0003\2\3\0009\3\4\0005\4\6\0=\4\5\0006\4\a\0009\4\b\0049\4\t\4'\6\n\0+\a\2\0B\4\3\0029\5\v\4\n\5\0\0X\5\6Ä6\5\r\0009\5\14\5'\a\15\0009\b\v\4B\5\3\2=\5\f\0049\5\16\4\n\5\0\0X\5\6Ä6\5\r\0009\5\14\5'\a\15\0009\b\16\4B\5\3\2=\5\17\0045\5\18\0009\6\17\4=\6\17\0053\6\19\0003\a\20\0003\b\21\0003\t\22\0003\n\23\0003\v\24\0003\f\25\0003\r\26\0003\14\27\0003\15\28\0003\16\29\0003\17\30\0003\18\31\0007\16 \0007\17!\0004\19\n\0005\20(\0005\21$\0003\22#\0=\22%\0215\22&\0009\23\17\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21)\20>\20\1\0195\0201\0005\21,\0005\22+\0003\23*\0>\23\1\22=\22%\21=\6-\0214\22\3\0006\23\0\0'\25.\0B\23\2\0029\23/\23>\23\1\0229\0230\5>\23\2\22=\22'\21=\0212\20>\20\2\0195\0204\0005\0213\0=\f%\21=\6-\0214\22\3\0009\23\f\5>\23\1\0229\0230\5>\23\2\22=\22'\21=\0215\20>\20\3\0195\0208\0005\0216\0006\22!\0=\22%\0214\22\3\0009\0237\5>\23\1\0229\0230\5>\23\2\22=\22'\21=\21!\20>\20\4\0195\20;\0005\21:\0003\0229\0=\22%\0214\22\3\0009\23\17\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21<\20>\20\5\0195\20?\0005\21=\0004\22\3\0009\23>\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21@\20>\20\6\0195\20C\0005\21A\0004\22\3\0009\23B\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21D\20>\20\a\0195\20G\0005\21E\0004\22\3\0009\23F\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21H\20>\20\b\0195\20K\0005\21I\0004\22\3\0009\23J\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21L\20>\20\t\19=\19\"\0034\19\3\0005\20P\0005\21N\0006\22 \0=\22%\0214\22\3\0009\23O\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21 \20>\20\1\19=\19M\0033\19Q\0003\20R\0003\21S\0003\22T\0003\23U\0003\24V\0003\25W\0003\26X\0004\27\t\0005\28Z\0005\29Y\0=\21%\29=\t-\0294\30\3\0009\31O\5>\31\1\0309\31\17\5>\31\2\30=\30'\29=\29[\28>\28\1\0275\28]\0005\29\\\0=\22%\29=\t-\0294\30\3\0009\31B\5>\31\1\0309\31\17\5>\31\2\30=\30'\29=\29^\28>\28\2\0275\28`\0005\29_\0=\23%\29=\t-\0294\30\3\0009\31>\5>\31\1\0309\31\17\5>\31\2\30=\30'\29=\29a\28>\28\3\0275\28d\0005\29c\0003\30b\0=\30%\0294\30\3\0009\31\17\5>\31\1\0309\31\17\5>\31\2\30=\30'\29=\29<\28>\28\4\0275\28j\0005\29g\0004\30\4\0003\31e\0>\31\1\30>\25\2\0303\31f\0>\31\3\30=\30%\29\r\30\6\0X\30\4Ä6\30\0\0' h\0B\30\2\0029\30i\30=\30-\0294\30\3\0009\31\f\5>\31\1\0309\0310\5>\31\2\30=\30'\29=\29k\28>\28\5\0275\28n\0005\29m\0003\30l\0=\30%\29\r\30\6\0X\30\4Ä6\30\0\0' h\0B\30\2\0029\30i\30=\30-\0294\30\3\0009\31\f\5>\31\1\0309\0310\5>\31\2\30=\30'\29=\29o\28>\28\6\0275\28r\0005\29q\0004\30\3\0>\26\1\0303\31p\0>\31\2\30=\30%\29\r\30\6\0X\30\4Ä6\30\0\0' h\0B\30\2\0029\30i\30=\30-\0294\30\3\0009\31\f\5>\31\1\0309\0310\5>\31\2\30=\30'\29=\29s\28>\28\a\0275\28w\0005\29t\0004\30\3\0009\31u\5>\31\1\0309\31F\5>\31\2\30=\30'\0294\30\3\0009\31u\5>\31\1\0309\31F\5>\31\2\30=\30v\29=\29x\28>\28\b\0274\28\6\0005\29~\0005\30|\0005\31z\0003 y\0> \1\0313 {\0> \3\31=\31%\0304\31\3\0009 \f\5> \1\0319 0\5> \2\31=\31'\0304\31\3\0009 }\5> \1\0319 0\5> \2\31=\31v\30=\30\29>\29\1\0285\29É\0005\30Ç\0005\31Ä\0003 Å\0> \2\31=\31%\0304\31\3\0009 \f\5> \1\0319 0\5> \2\31=\31'\0304\31\3\0009 }\5> \1\0319 0\5> \2\31=\31v\30=\30Ñ\29>\29\2\0285\29à\0005\30á\0005\31Ö\0003 Ü\0> \2\31=\31%\0304\31\3\0009 \f\5> \1\0319 0\5> \2\31=\31'\0304\31\3\0009 }\5> \1\0319 0\5> \2\31=\31v\30=\30â\29>\29\3\0285\29ç\0005\30å\0005\31ã\0003 ä\0> \1\31=\31%\0304\31\3\0009 \f\5> \1\0319 0\5> \2\31=\31'\0304\31\3\0009 }\5> \1\0319 0\5> \2\31=\31v\30=\30é\29>\29\4\0285\29í\0005\30ë\0005\31ê\0003 è\0> \1\31=\31%\0304\31\3\0009 u\5> \1\0319 F\5> \2\31=\31'\0304\31\3\0009 u\5> \1\0319 F\5> \2\31=\31v\30=\30ì\29>\29\5\28=\27î\0033\29ï\0007\29ñ\0006\29\a\0009\29\b\0299\29ó\29'\31ò\0' ô\0'!ö\0005\"õ\0B\29\5\0014\29\3\0005\30†\0005\31ü\0005 û\0003!ù\0>!\1 = %\31=\b-\0314 \3\0006!\0\0'#.\0B!\2\0029!/!>!\1 9!0\5>!\2 = '\31=\31°\30>\30\1\0295\30£\0005\31¢\0=\r%\31=\6-\0314 \3\0009!\f\5>!\1 9!\17\5>!\2 = '\31=\31§\30>\30\2\29=\29ú\0034\29\3\0005\30ß\0005\31¶\0004 \3\0009!\f\5>!\1 9!\17\5>!\2 = '\31=\31®\30>\30\1\29=\29•\0039\29©\0B\29\1\0012\0\0ÄK\0\1\0\20load_galaxyline\16SBufferIcon\1\0\0\1\0\1\rprovider\15BufferIcon\21short_line_right\14SFileName\1\0\0\1\0\0\14SFileIcon\1\0\0\1\0\0\1\3\0\0\0\rFileIcon\0\20short_line_left\1\0\2\vsilent\2\fnoremap\2 :lua ToggleGalaxyline()<CR>\6!\6n\20nvim_set_keymap\21ToggleGalaxyline\0\nright\fPerCent\1\0\0\1\0\1\14separator\5\1\3\0\0\0\16LinePercent\0\rFileSize\1\0\0\1\0\1\14separator\5\1\3\0\0\0\rFileSize\0\15BufferType\1\0\0\1\0\1\14separator\5\0\1\2\0\0\17FileTypeName\15FileEncode\1\0\0\1\0\1\14separator\5\0\1\2\0\0\15FileEncode\15FileFormat\1\0\0\15section_fg\1\0\1\14separator\5\0\1\3\0\0\0\15FileFormat\0\rLineInfo\1\0\0\24separator_highlight\ngray2\1\0\2\14separator\6 \rprovider\15LineColumn\14GitBranch\1\0\0\1\0\0\0\fGitIcon\1\0\0\1\0\0\0\fGitRoot\1\0\0\24check_git_workspace\25galaxyline.condition\1\0\0\0\0\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\1\ticon\6-\17DiffModified\1\0\0\1\0\1\ticon\6~\fDiffAdd\1\0\0\1\0\1\ticon\6+\0\0\0\0\0\0\0\0\1\0\0\ngreen\1\0\1\ticon\n ÔÇÖ \bmid\19DiagnosticHint\1\0\0\tgrey\1\0\2\ticon\n ÔÇ≠ \rprovider\19DiagnosticHint\19DiagnosticInfo\1\0\0\tblue\1\0\2\ticon\n ÔÅö \rprovider\19DiagnosticInfo\19DiagnosticWarn\1\0\0\vorange\1\0\2\ticon\n ÔÅ± \rprovider\19DiagnosticWarn\20DiagnosticError\1\0\0\tred1\1\0\2\ticon\n ÔÅó \rprovider\20DiagnosticError\nSpace\1\0\0\1\0\0\0\1\0\0\vyellow\1\0\1\ticon\b Œª\rFileName\1\0\0\1\0\0\rFileIcon\1\0\0\15section_bg\18get_file_icon!galaxyline.provider_fileinfo\14condition\1\0\0\1\3\0\0\0\rFileIcon\0\vViMode\1\0\0\14highlight\1\4\0\0\0\0\tbold\rprovider\1\0\0\0\tleft\fCocFunc\14CocStatus\0\0\0\0\0\0\0\0\0\0\0\0\0\1\0\15\vpurple\f#c678dd\rdarkgrey\f#5c6370\ngreen\f#98c379\ngray3\f#3e4452\tblue\f#61afef\15section_bg\f#38393f\ngray1\f#5c6370\vyellow\f#e5c07b\ngray2\f#2c323d\afg\f#aab2bf\tred2\f#be5046\tred1\f#e06c75\tgrey\f#848586\vorange\f#e5c07b\15middlegrey\f#8791A5\abg\15background\b#%x\vformat\vstring\afg\15foreground\15StatusLine\24nvim_get_hl_by_name\bapi\bvim\1\6\0\0\tdefx\rpackager\nvista\rNvimTree\17coc-explorer\20short_line_list\fsection\0\0\15galaxyline\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/glow.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ago\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/go.nvim"
  },
  ["goto-preview"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vheight\3\30\nwidth\3x\nsetup\17goto-preview\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/goto-preview"
  },
  ["hop.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\nΩ\1\0\0\a\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0005\6\6\0B\1\5\1\18\1\0\0'\3\a\0'\4\4\0'\5\b\0005\6\t\0B\1\5\1K\0\1\0\1\0\1\fnoremap\1$<Plug>kommentary_visual_default\6v\1\0\1\fnoremap\1\"<Plug>kommentary_line_default\n<c-_>\6n\bmap\nutils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lsp-rooter.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15lsp-rooter\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/lsp-rooter.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["mkdir.nvim"] = {
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/mkdir.nvim"
  },
  neogit = {
    loaded = true,
    needs_bufread = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\3\0\0\n<C-d>\n<C-u>\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÖ\1\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\17map_complete\2$nvim-autopairs.completion.compe\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nµ\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\1\rfiletype\rNvimTree\1\0\2\25middle_mouse_command\16bdelete! %d\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/sk/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\2\nÌ\2\0\0\a\0\18\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0\18\1\0\0'\3\b\0'\4\t\0'\5\n\0005\6\v\0B\1\5\1\18\1\0\0'\3\b\0'\4\f\0'\5\r\0005\6\14\0B\1\5\1\18\1\0\0'\3\b\0'\4\15\0'\5\16\0005\6\17\0B\1\5\1K\0\1\0\1\0\1\texpr\2\27compe#confirm('<c-e>')\n<c-e>\1\0\1\texpr\2\26compe#confirm('<cr>')\t<cr>\1\0\1\texpr\2\21compe#complete()\14<c-space>\6i\bmap\nutils\vsource\1\0\0\1\0\n\vbuffer\2\tpath\2\ttags\2\ftabnine\2\14ultisnips\2\rnvim_lua\2\tomni\1\tcalc\2\rnvim_lsp\2\nspell\2\nsetup\ncompe\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-cursorline"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-cursorline"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n…\5\0\2\b\2\22\0;6\2\0\0'\4\1\0B\2\2\0029\2\2\2B\2\1\1-\2\0\0\18\4\1\0'\5\3\0'\6\4\0B\2\4\1-\2\1\0\18\4\1\0'\5\5\0'\6\6\0'\a\a\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\b\0'\a\t\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\n\0'\a\v\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\f\0'\a\r\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\14\0'\a\15\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\16\0'\a\17\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\18\0'\a\19\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\20\0'\a\21\0B\2\5\1K\0\1\0\1¿\0¿<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>\r<space>e+<cmd>lua vim.lsp.buf.code_action()<cr>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<cr>\t<f2>J<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>\14<space>wl.<cmd>lua vim.lsp.buf.implementation()<cr>\agi%<cmd>lua vim.lsp.buf.hover()<cr>\n<c-i>*<cmd>lua vim.lsp.buf.definition()<cr>\agd+<cmd>lua vim.lsp.buf.declaration()<cr>\agD\6n\27v:lua.vim.lsp.omnifunc\romnifunc\14on_attach\18lsp_signature\frequireπ\1\0\0\n\1\b\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\0026\1\4\0\18\3\0\0B\1\2\4H\4\tÄ6\6\0\0'\b\5\0B\6\2\0028\6\5\0069\6\2\0065\b\6\0-\t\0\0=\t\a\bB\6\2\1F\4\3\3R\4ıK\0\1\0\2¿\14on_attach\1\0\0\14lspconfig\npairs\22installed_servers\nsetup\15lspinstall\frequire5\0\0\3\1\3\0\a-\0\0\0B\0\1\0016\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\3¿\fbufdo e\bcmd\bvimè\1\1\0\a\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\1\0B\1\2\0029\1\3\0013\2\4\0003\3\5\0\18\4\3\0B\4\1\0016\4\0\0'\6\6\0B\4\2\0023\5\b\0=\5\a\0042\0\0ÄK\0\1\0\0\22post_install_hook\15lspinstall\0\0\vbufset\vbufmap\nutils\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-minimap"] = {
    commands = { "MinimapOpen", "MinimapToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/nvim-minimap"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-scrollview"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-scrollview"
  },
  ["nvim-toggleterm.lua"] = {
    config = { "\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14direction\nfloat\17open_mapping\v<c-t>t\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\na\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\28<cmd>NvimTreeToggle<cr>\n<c-b>\6n\bmap\nutils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nü\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    config = { "\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\frainbow\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    config = { "\27LJ\2\nj\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15playground\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["range-highlight.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20range-highlight\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/range-highlight.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["telescope-bibtex.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\vbibtex\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/telescope-bibtex.nvim"
  },
  ["telescope-ghq.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bghq\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/telescope-ghq.nvim"
  },
  ["telescope-github.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\agh\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16media_files\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-bibtex.nvim", "telescope-ghq.nvim", "telescope-github.nvim", "telescope-media-files.nvim", "todo-comments.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\27colorscheme tokyonight\17nvim_command\bapi\bvim\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/twilight.nvim"
  },
  ultisnips = {
    after_files = { "/home/sk/.local/share/nvim/site/pack/packer/opt/ultisnips/after/plugin/UltiSnips_after.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/ultisnips"
  },
  undotree = {
    config = { "\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 undotree_SetFocusWhenToggle\6g\bvim\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/vim-better-whitespace"
  },
  ["vim-quickrun"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/vim-quickrun"
  },
  ["vim-scouter"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/vim-scouter"
  },
  ["vim-silicon"] = {
    commands = { "Silicon" },
    loaded = false,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/vim-silicon"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/vim-visual-multi"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/vim-wakatime"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/sk/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  },
  ["zero.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tzero\frequire\0" },
    loaded = true,
    path = "/home/sk/.local/share/nvim/site/pack/packer/start/zero.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-visual-multi
time([[Setup for vim-visual-multi]], true)
try_loadstring("\27LJ\2\nœ\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0K\0\1\0\22VM_mouse_mappings\1\0\4\15Find Under\n<m-d>\17Mouse Cursor\18<m-leftmouse>\23Find Subword Under\n<m-d>\15Mouse Word\19<m-rightmouse>\fVM_maps\f<space>\14VM_leader\6g\bvim\0", "setup", "vim-visual-multi")
time([[Setup for vim-visual-multi]], false)
time([[packadd for vim-visual-multi]], true)
vim.cmd [[packadd vim-visual-multi]]
time([[packadd for vim-visual-multi]], false)
-- Setup for: neogit
time([[Setup for neogit]], true)
try_loadstring("\27LJ\2\ne\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\27<cmd>Neogit commit<cr>\15<leader>gc\6n\bmap\nutils\frequire\0", "setup", "neogit")
time([[Setup for neogit]], false)
time([[packadd for neogit]], true)
vim.cmd [[packadd neogit]]
time([[packadd for neogit]], false)
-- Setup for: todo-comments.nvim
time([[Setup for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\ne\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\27<cmd>TodoTelescope<cr>\15<leader>td\6n\bmap\nutils\frequire\0", "setup", "todo-comments.nvim")
time([[Setup for todo-comments.nvim]], false)
-- Setup for: tokyonight.nvim
time([[Setup for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0+\1\2\0=\1\6\0K\0\1\0\18termguicolors\bopt\nnight\21tokyonight_style\31tokyonight_italic_keywords\6g\bvim\0", "setup", "tokyonight.nvim")
time([[Setup for tokyonight.nvim]], false)
time([[packadd for tokyonight.nvim]], true)
vim.cmd [[packadd tokyonight.nvim]]
time([[packadd for tokyonight.nvim]], false)
-- Setup for: nvim-bufferline.lua
time([[Setup for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n—\2\0\0\6\0\15\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1\18\1\0\0'\3\3\0'\4\6\0'\5\a\0B\1\4\1\18\1\0\0'\3\3\0'\4\b\0'\5\t\0B\1\4\0016\1\n\0009\1\v\0015\2\r\0=\2\f\0016\1\n\0009\1\v\1+\2\1\0=\2\14\1K\0\1\0-indent_blankline_show_first_indent_level\1\4\0\0\14dashboard\thelp\vpacker&indent_blankline_filetype_exclude\6g\bvim\28<cmd>BufferLinePick<cr>\abp!<cmd>BufferLineCycleNext<cr>\abl!<cmd>BufferLineCyclePrev<cr>\abh\6n\bmap\nutils\frequire\0", "setup", "nvim-bufferline.lua")
time([[Setup for nvim-bufferline.lua]], false)
time([[packadd for nvim-bufferline.lua]], true)
vim.cmd [[packadd nvim-bufferline.lua]]
time([[packadd for nvim-bufferline.lua]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n®\1\0\0\6\0\b\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1\18\1\0\0'\3\3\0'\4\6\0'\5\a\0B\1\4\1K\0\1\0!<cmd>Telescope live_grep<cr>\15<leader>lg\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\bmap\nutils\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: glow.nvim
time([[Setup for glow.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\18<cmd>Glow<cr>\15<leader>gl\6n\bmap\nutils\frequire\0", "setup", "glow.nvim")
time([[Setup for glow.nvim]], false)
-- Setup for: kommentary
time([[Setup for kommentary]], true)
try_loadstring("\27LJ\2\nD\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\1\0=\1\2\0K\0\1\0'kommentary_create_default_mappings\6g\bvim\0", "setup", "kommentary")
time([[Setup for kommentary]], false)
-- Setup for: twilight.nvim
time([[Setup for twilight.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\22<cmd>Twilight<cr>\15<leader>tw\6n\bmap\nutils\frequire\0", "setup", "twilight.nvim")
time([[Setup for twilight.nvim]], false)
time([[packadd for twilight.nvim]], true)
vim.cmd [[packadd twilight.nvim]]
time([[packadd for twilight.nvim]], false)
-- Setup for: chowcho.nvim
time([[Setup for chowcho.nvim]], true)
try_loadstring("\27LJ\2\n_\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\21<cmd>Chowcho<cr>\15<leader>pw\6n\bmap\nutils\frequire\0", "setup", "chowcho.nvim")
time([[Setup for chowcho.nvim]], false)
time([[packadd for chowcho.nvim]], true)
vim.cmd [[packadd chowcho.nvim]]
time([[packadd for chowcho.nvim]], false)
-- Setup for: undotree
time([[Setup for undotree]], true)
try_loadstring("\27LJ\2\nf\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\28<cmd>UndotreeToggle<cr>\15<leader>ud\6n\bmap\nutils\frequire\0", "setup", "undotree")
time([[Setup for undotree]], false)
time([[packadd for undotree]], true)
vim.cmd [[packadd undotree]]
time([[packadd for undotree]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n1\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1(\0=\1\2\0K\0\1\0\20nvim_tree_width\6g\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: goto-preview
time([[Setup for goto-preview]], true)
try_loadstring("\27LJ\2\n·\1\0\0\6\0\b\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1\18\1\0\0'\3\3\0'\4\6\0'\5\a\0B\1\4\1K\0\1\0G<cmd>lua require('goto-preview').goto_preview_implementation()<CR>\bgpiC<cmd>lua require('goto-preview').goto_preview_definition()<CR>\bgpd\6n\bmap\nutils\frequire\0", "setup", "goto-preview")
time([[Setup for goto-preview]], false)
time([[packadd for goto-preview]], true)
vim.cmd [[packadd goto-preview]]
time([[packadd for goto-preview]], false)
-- Setup for: hop.nvim
time([[Setup for hop.nvim]], true)
try_loadstring("\27LJ\2\np\0\0\a\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0005\6\6\0B\1\5\1K\0\1\0\1\0\1\vsilent\2\21<cmd>HopWord<cr>\17<leader><cr>\6n\bmap\nutils\frequire\0", "setup", "hop.nvim")
time([[Setup for hop.nvim]], false)
time([[packadd for hop.nvim]], true)
vim.cmd [[packadd hop.nvim]]
time([[packadd for hop.nvim]], false)
-- Setup for: surround.nvim
time([[Setup for surround.nvim]], true)
try_loadstring("\27LJ\2\nö\1\0\0\6\0\b\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1\18\1\0\0'\3\3\0'\4\6\0'\5\a\0B\1\4\1K\0\1\0\27<cmd>DiffviewClose<cr>\15<leader>dF\26<cmd>DiffviewOpen<cr>\15<leader>df\6n\bmap\nutils\frequire\0", "setup", "surround.nvim")
time([[Setup for surround.nvim]], false)
-- Setup for: ultisnips
time([[Setup for ultisnips]], true)
try_loadstring("\27LJ\2\nZ\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\29~/.config/nvim/ultisnips UltiSnipsSnippetDirectories\6g\bvim\0", "setup", "ultisnips")
time([[Setup for ultisnips]], false)
-- Setup for: vim-better-whitespace
time([[Setup for vim-better-whitespace]], true)
try_loadstring("\27LJ\2\nU\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\14dashboard*better_whitespace_filetypes_blacklist\6g\bvim\0", "setup", "vim-better-whitespace")
time([[Setup for vim-better-whitespace]], false)
time([[packadd for vim-better-whitespace]], true)
vim.cmd [[packadd vim-better-whitespace]]
time([[packadd for vim-better-whitespace]], false)
-- Setup for: symbols-outline.nvim
time([[Setup for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\28<cmd>SymbolsOutline<cr>\15<leader>ol\6n\bmap\nutils\frequire\0", "setup", "symbols-outline.nvim")
time([[Setup for symbols-outline.nvim]], false)
time([[packadd for symbols-outline.nvim]], true)
vim.cmd [[packadd symbols-outline.nvim]]
time([[packadd for symbols-outline.nvim]], false)
-- Setup for: vim-quickrun
time([[Setup for vim-quickrun]], true)
try_loadstring("\27LJ\2\n_\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\22<cmd>QuickRun<cr>\14<leader>r\6n\bmap\nutils\frequire\0", "setup", "vim-quickrun")
time([[Setup for vim-quickrun]], false)
time([[packadd for vim-quickrun]], true)
vim.cmd [[packadd vim-quickrun]]
time([[packadd for vim-quickrun]], false)
-- Setup for: nvim-compe
time([[Setup for nvim-compe]], true)
try_loadstring("\27LJ\2\nD\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\fmenuone\rnoselect\16completeopt\bopt\bvim\0", "setup", "nvim-compe")
time([[Setup for nvim-compe]], false)
time([[packadd for nvim-compe]], true)
vim.cmd [[packadd nvim-compe]]
time([[packadd for nvim-compe]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n”\3\0\0\6\0\20\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1\18\1\0\0'\3\3\0'\4\6\0'\5\a\0B\1\4\1\18\1\0\0'\3\3\0'\4\b\0'\5\t\0B\1\4\1\18\1\0\0'\3\3\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\3\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\3\0'\4\14\0'\5\15\0B\1\4\0016\1\16\0009\1\17\1'\2\19\0=\2\18\1K\0\1\0\14telescope dashboard_default_executive\6g\bvim\30<cmd>DashboardNewFile<cr>\15<leader>cn\31<cmd>DashboardFindWord<cr>\15<leader>fa\"<cmd>DashboardFindHistory<cr>\15<leader>fh\31<cmd>DashboardFindFile<cr>\15<leader>ff(<cmd>DashboardChangeColorscheme<cr>\15<leader>tc <cmd>DashboardJumpMarks<cr>\15<leader>fb\6n\bmap\nutils\frequire\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
time([[packadd for dashboard-nvim]], true)
vim.cmd [[packadd dashboard-nvim]]
time([[packadd for dashboard-nvim]], false)
-- Setup for: zen-mode.nvim
time([[Setup for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n_\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\21<cmd>ZenMode<cr>\15<leader>zm\6n\bmap\nutils\frequire\0", "setup", "zen-mode.nvim")
time([[Setup for zen-mode.nvim]], false)
time([[packadd for zen-mode.nvim]], true)
vim.cmd [[packadd zen-mode.nvim]]
time([[packadd for zen-mode.nvim]], false)
-- Setup for: vim-silicon
time([[Setup for vim-silicon]], true)
try_loadstring("\27LJ\2\n_\0\0\6\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0\18\1\0\0'\3\3\0'\4\4\0'\5\5\0B\1\4\1K\0\1\0\21<cmd>Silicon<cr>\15<leader>ss\6n\bmap\nutils\frequire\0", "setup", "vim-silicon")
time([[Setup for vim-silicon]], false)
-- Config for: playground
time([[Config for playground]], true)
try_loadstring("\27LJ\2\nj\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15playground\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "playground")
time([[Config for playground]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\b\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2H\0\1\4\0\3\1\f6\1\0\0009\1\1\0019\1\2\1)\3\0\0B\1\2\2\25\1\0\1\0\0\1\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\rwinwidth\afn\bvim\4\25\0\0\2\1\0\0\4-\0\0\0B\0\1\2\19\0\0\0L\0\2\0\1¿|\0\2\v\1\2\0\26+\2\1\0)\3\1\0\21\4\0\0)\5\1\0M\3\20Ä6\a\0\0008\t\6\0B\a\2\2\a\a\1\0X\a\tÄ-\a\0\0008\t\6\0\18\n\1\0B\a\3\2\18\2\a\0\15\0\2\0X\a\aÄX\3\aÄX\a\5Ä8\a\6\0\5\a\1\0X\a\2Ä+\a\2\0L\a\2\0O\3ÏL\2\2\0\a¿\ntable\ttypea\0\0\4\3\4\0\r-\0\0\0B\0\1\2\15\0\0\0X\1\bÄ-\0\1\0-\2\2\0009\2\0\0026\3\1\0009\3\2\0039\3\3\3B\0\3\2\19\0\0\0L\0\2\0\6¿\a¿\0¿\rfiletype\abo\bvim\20short_line_list+\0\0\3\2\0\0\b-\0\0\0)\2(\0B\0\2\2\15\0\0\0X\1\2Ä-\0\1\0B\0\1\2L\0\2\0\2¿\6¿à\2\0\0\5\1\17\00015\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\0\1=\1\5\0-\1\0\0009\1\6\1=\1\a\0-\1\0\0009\1\6\1=\1\b\0-\1\0\0009\1\6\1=\1\t\0-\1\0\0009\1\n\1=\1\v\0-\1\0\0009\1\3\1=\1\f\0006\1\r\0009\1\14\0019\1\15\1B\1\1\0028\1\1\0\n\1\0\0X\1\aÄ6\1\r\0009\1\14\0019\1\15\1B\1\1\0028\1\1\0L\1\2\0X\1\tÄ6\1\16\0006\3\r\0009\3\14\0039\3\15\3B\3\1\0A\1\0\1-\1\0\0009\1\6\1L\1\2\0K\0\1\0\5¿\nprint\tmode\afn\bvim\6t\6R\tred1\6v\5\6V\vpurple\6c\6i\tblue\6n\1\0\0\ngreenl\0\0\1\0\a\0\0166\0\0\0009\0\1\0009\0\2\0\a\0\3\0X\0\2Ä'\0\4\0L\0\2\0006\0\0\0009\0\1\0009\0\5\0\v\0\2\0X\0\2Ä'\0\6\0L\0\2\0'\0\4\0L\0\2\0\n ÔÅó \rreadonly\5\thelp\rfiletype\abo\bvimß\3\0\0\5\1\14\2-6\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\2\0B\0\3\0026\1\0\0009\1\4\0019\1\5\1\18\3\0\0B\1\2\2\t\1\0\0X\1\2Ä'\1\6\0L\1\2\0006\1\a\0009\1\b\1-\3\0\0B\3\1\0A\1\0\2\b\1\1\0X\1\5Ä\18\1\0\0-\2\0\0B\2\1\2&\1\2\1L\1\2\0006\1\0\0009\1\t\0019\1\n\1\15\0\1\0X\2\tÄ6\1\0\0009\1\t\0019\1\v\1\15\0\1\0X\2\4Ä\18\1\0\0'\2\f\0&\1\2\1L\1\2\0\18\1\0\0'\2\r\0&\1\2\1L\1\2\0\v¿\6 \n ÔÅÄ \rmodified\15modifiable\abo\blen\vstring\5\nempty\afn•\1    if winwidth(0) < 50\n      echo expand('%:t')\n    elseif winwidth(0) > 150\n      echo expand('%')\n    else\n      echo pathshorten(expand('%'))\n    endif\n    \14nvim_exec\bapi\bvim\2\0q\0\0\4\3\4\0\17-\0\0\0-\2\1\0009\2\0\0026\3\1\0009\3\2\0039\3\3\3B\0\3\2\15\0\0\0X\1\5Ä6\0\1\0009\0\2\0009\0\3\0L\0\2\0X\0\2Ä-\0\2\0D\0\1\0K\0\1\0\a¿\0¿\f¿\rfiletype\abo\bvim\20short_line_listØ\1\0\1\n\0\t\0\27'\1\0\0007\1\1\0006\1\2\0009\1\3\1\18\3\0\0'\4\4\0B\1\3\4X\4\15Ä6\5\2\0009\5\5\5\18\a\4\0'\b\6\0)\t\0\0B\5\4\0027\5\a\0006\5\a\0\14\0\5\0X\5\5Ä6\5\1\0'\6\b\0\18\a\4\0&\5\a\0057\5\1\0E\4\3\2R\4Ô6\1\1\0L\1\2\0\6 \rerr_warn\r^[WE]%d+\tfind\v[^%s]+\vgmatch\vstring\17shorter_stat\5P\0\0\4\1\4\0\r6\0\0\0009\0\1\0009\0\2\0B\0\1\2\15\0\0\0X\1\2Ä\a\0\3\0X\1\2Ä'\1\3\0L\1\2\0-\1\0\0\18\3\0\0D\1\2\0\14¿\5\15coc#status\afn\bvim[\0\0\3\1\5\1\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\t\0\0\0X\0\2Ä-\0\0\0D\0\1\0'\0\4\0L\0\2\0\15¿\5\26*coc#rpc#start_server\vexists\afn\bvim\2g\0\0\5\0\5\0\v6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\3\0\0'\4\4\0B\0\4\3\14\0\0\0X\2\1ÄK\0\1\0L\1\2\0\25coc_current_function\21nvim_buf_get_var\bapi\bvim\npcall[\0\0\3\1\5\1\v6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\t\0\0\0X\0\2Ä-\0\0\0D\0\1\0'\0\4\0L\0\2\0\17¿\5\26*coc#rpc#start_server\vexists\afn\bvim\2°\2\0\0\6\1\n\0\0295\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0-\4\0\0B\4\1\2&\3\4\3B\1\2\0016\1\1\0009\1\5\0019\1\6\1B\1\1\0028\1\1\0\n\1\0\0X\1\nÄ'\1\a\0006\2\1\0009\2\5\0029\2\6\2B\2\1\0028\2\2\0'\3\b\0&\1\3\1L\1\2\0X\1\2Ä'\1\t\0L\1\2\0K\0\1\0\n¿\15  V-BLOCK \6 \a  \tmode\afn\27hi GalaxyViMode guibg=\17nvim_command\bapi\bvim\1\0\n\6R\fREPLACE\6S\vS-LINE\6s\vSELECT\6n\vNORMAL\6V\vV-LINE\6v\vVISUAL\6i\vINSERT\6c\fCOMMAND\6t\rTERMINAL\5\vVISUAL\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 à\1\0\0\4\0\b\1\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\b\0\0\0X\0\2Ä'\0\4\0L\0\2\0006\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\a\0D\0\3\0\19coc_git_status\21nvim_buf_get_var\bapi\5\21b:coc_git_status\vexists\afn\bvim\2ä\1\0\0\4\0\b\1\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\b\0\0\0X\0\2Ä'\0\4\0L\0\2\0006\0\0\0009\0\5\0009\0\6\0)\2\0\0'\3\a\0D\0\3\0\20gitsigns_status\21nvim_buf_get_var\bapi\5\22b:gitsigns_status\vexists\afn\bvim\2S\0\0\5\1\4\0\r-\0\0\0B\0\1\0026\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\2\v\1\0\0X\2\2Ä'\2\3\0X\3\1Ä\18\2\1\0L\2\2\0\20¿\5\f%+(%d+)\nmatch\vstringR\0\0\5\1\4\0\r-\0\0\0B\0\1\0026\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\2\v\1\0\0X\2\2Ä'\2\3\0X\3\1Ä\18\2\1\0L\2\2\0\20¿\5\v~(%d+)\nmatch\vstringS\0\0\5\1\4\0\r-\0\0\0B\0\1\0026\1\0\0009\1\1\1\18\3\0\0'\4\2\0B\1\3\2\v\1\0\0X\2\2Ä'\2\3\0X\3\1Ä\18\2\1\0L\2\2\0\20¿\5\f%-(%d+)\nmatch\vstring'\0\1\5\0\2\0\4\18\3\0\0009\1\0\0'\4\1\0D\1\3\0\14^.+/(.+)$\nmatchà\1\0\0\6\1\6\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\14\0\0\0X\1\2Ä'\1\3\0L\1\2\0\18\3\0\0009\1\4\0'\4\5\0'\5\3\0B\1\4\2-\2\0\0\18\4\1\0D\2\2\0\24¿\r/.git/?$\tgsub\5\16get_git_dir\28galaxyline.provider_vcs\frequireÉ\1\0\0\6\0\a\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\2\14\0\0\0X\1\2Ä'\1\3\0L\1\2\0006\1\4\0009\1\5\1\18\3\0\0'\4\6\0'\5\3\0D\1\4\0\b%s+\tgsub\vstring\5\19get_git_branch\28galaxyline.provider_vcs\frequire\17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\tÔû° \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 \18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  \17\0\0\1\0\1\0\2'\0\0\0L\0\2\0\6 Ñ\1\0\0\2\4\3\0\19-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0-\1\2\0\5\0\1\0X\0\4Ä-\0\1\0-\1\3\0=\1\1\0X\0\3Ä-\0\1\0-\1\2\0=\1\1\0-\0\0\0009\0\2\0B\0\1\1K\0\1\0\0¿\3¿\27¿\28¿\20load_galaxyline\nright\23disable_galaxyline\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a  ´\27\1\0$\0™\1\0ÿ\0036\0\0\0'\2\1\0B\0\2\0023\1\2\0003\2\3\0009\3\4\0005\4\6\0=\4\5\0006\4\a\0009\4\b\0049\4\t\4'\6\n\0+\a\2\0B\4\3\0029\5\v\4\n\5\0\0X\5\6Ä6\5\r\0009\5\14\5'\a\15\0009\b\v\4B\5\3\2=\5\f\0049\5\16\4\n\5\0\0X\5\6Ä6\5\r\0009\5\14\5'\a\15\0009\b\16\4B\5\3\2=\5\17\0045\5\18\0009\6\17\4=\6\17\0053\6\19\0003\a\20\0003\b\21\0003\t\22\0003\n\23\0003\v\24\0003\f\25\0003\r\26\0003\14\27\0003\15\28\0003\16\29\0003\17\30\0003\18\31\0007\16 \0007\17!\0004\19\n\0005\20(\0005\21$\0003\22#\0=\22%\0215\22&\0009\23\17\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21)\20>\20\1\0195\0201\0005\21,\0005\22+\0003\23*\0>\23\1\22=\22%\21=\6-\0214\22\3\0006\23\0\0'\25.\0B\23\2\0029\23/\23>\23\1\0229\0230\5>\23\2\22=\22'\21=\0212\20>\20\2\0195\0204\0005\0213\0=\f%\21=\6-\0214\22\3\0009\23\f\5>\23\1\0229\0230\5>\23\2\22=\22'\21=\0215\20>\20\3\0195\0208\0005\0216\0006\22!\0=\22%\0214\22\3\0009\0237\5>\23\1\0229\0230\5>\23\2\22=\22'\21=\21!\20>\20\4\0195\20;\0005\21:\0003\0229\0=\22%\0214\22\3\0009\23\17\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21<\20>\20\5\0195\20?\0005\21=\0004\22\3\0009\23>\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21@\20>\20\6\0195\20C\0005\21A\0004\22\3\0009\23B\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21D\20>\20\a\0195\20G\0005\21E\0004\22\3\0009\23F\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21H\20>\20\b\0195\20K\0005\21I\0004\22\3\0009\23J\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21L\20>\20\t\19=\19\"\0034\19\3\0005\20P\0005\21N\0006\22 \0=\22%\0214\22\3\0009\23O\5>\23\1\0229\23\17\5>\23\2\22=\22'\21=\21 \20>\20\1\19=\19M\0033\19Q\0003\20R\0003\21S\0003\22T\0003\23U\0003\24V\0003\25W\0003\26X\0004\27\t\0005\28Z\0005\29Y\0=\21%\29=\t-\0294\30\3\0009\31O\5>\31\1\0309\31\17\5>\31\2\30=\30'\29=\29[\28>\28\1\0275\28]\0005\29\\\0=\22%\29=\t-\0294\30\3\0009\31B\5>\31\1\0309\31\17\5>\31\2\30=\30'\29=\29^\28>\28\2\0275\28`\0005\29_\0=\23%\29=\t-\0294\30\3\0009\31>\5>\31\1\0309\31\17\5>\31\2\30=\30'\29=\29a\28>\28\3\0275\28d\0005\29c\0003\30b\0=\30%\0294\30\3\0009\31\17\5>\31\1\0309\31\17\5>\31\2\30=\30'\29=\29<\28>\28\4\0275\28j\0005\29g\0004\30\4\0003\31e\0>\31\1\30>\25\2\0303\31f\0>\31\3\30=\30%\29\r\30\6\0X\30\4Ä6\30\0\0' h\0B\30\2\0029\30i\30=\30-\0294\30\3\0009\31\f\5>\31\1\0309\0310\5>\31\2\30=\30'\29=\29k\28>\28\5\0275\28n\0005\29m\0003\30l\0=\30%\29\r\30\6\0X\30\4Ä6\30\0\0' h\0B\30\2\0029\30i\30=\30-\0294\30\3\0009\31\f\5>\31\1\0309\0310\5>\31\2\30=\30'\29=\29o\28>\28\6\0275\28r\0005\29q\0004\30\3\0>\26\1\0303\31p\0>\31\2\30=\30%\29\r\30\6\0X\30\4Ä6\30\0\0' h\0B\30\2\0029\30i\30=\30-\0294\30\3\0009\31\f\5>\31\1\0309\0310\5>\31\2\30=\30'\29=\29s\28>\28\a\0275\28w\0005\29t\0004\30\3\0009\31u\5>\31\1\0309\31F\5>\31\2\30=\30'\0294\30\3\0009\31u\5>\31\1\0309\31F\5>\31\2\30=\30v\29=\29x\28>\28\b\0274\28\6\0005\29~\0005\30|\0005\31z\0003 y\0> \1\0313 {\0> \3\31=\31%\0304\31\3\0009 \f\5> \1\0319 0\5> \2\31=\31'\0304\31\3\0009 }\5> \1\0319 0\5> \2\31=\31v\30=\30\29>\29\1\0285\29É\0005\30Ç\0005\31Ä\0003 Å\0> \2\31=\31%\0304\31\3\0009 \f\5> \1\0319 0\5> \2\31=\31'\0304\31\3\0009 }\5> \1\0319 0\5> \2\31=\31v\30=\30Ñ\29>\29\2\0285\29à\0005\30á\0005\31Ö\0003 Ü\0> \2\31=\31%\0304\31\3\0009 \f\5> \1\0319 0\5> \2\31=\31'\0304\31\3\0009 }\5> \1\0319 0\5> \2\31=\31v\30=\30â\29>\29\3\0285\29ç\0005\30å\0005\31ã\0003 ä\0> \1\31=\31%\0304\31\3\0009 \f\5> \1\0319 0\5> \2\31=\31'\0304\31\3\0009 }\5> \1\0319 0\5> \2\31=\31v\30=\30é\29>\29\4\0285\29í\0005\30ë\0005\31ê\0003 è\0> \1\31=\31%\0304\31\3\0009 u\5> \1\0319 F\5> \2\31=\31'\0304\31\3\0009 u\5> \1\0319 F\5> \2\31=\31v\30=\30ì\29>\29\5\28=\27î\0033\29ï\0007\29ñ\0006\29\a\0009\29\b\0299\29ó\29'\31ò\0' ô\0'!ö\0005\"õ\0B\29\5\0014\29\3\0005\30†\0005\31ü\0005 û\0003!ù\0>!\1 = %\31=\b-\0314 \3\0006!\0\0'#.\0B!\2\0029!/!>!\1 9!0\5>!\2 = '\31=\31°\30>\30\1\0295\30£\0005\31¢\0=\r%\31=\6-\0314 \3\0009!\f\5>!\1 9!\17\5>!\2 = '\31=\31§\30>\30\2\29=\29ú\0034\29\3\0005\30ß\0005\31¶\0004 \3\0009!\f\5>!\1 9!\17\5>!\2 = '\31=\31®\30>\30\1\29=\29•\0039\29©\0B\29\1\0012\0\0ÄK\0\1\0\20load_galaxyline\16SBufferIcon\1\0\0\1\0\1\rprovider\15BufferIcon\21short_line_right\14SFileName\1\0\0\1\0\0\14SFileIcon\1\0\0\1\0\0\1\3\0\0\0\rFileIcon\0\20short_line_left\1\0\2\vsilent\2\fnoremap\2 :lua ToggleGalaxyline()<CR>\6!\6n\20nvim_set_keymap\21ToggleGalaxyline\0\nright\fPerCent\1\0\0\1\0\1\14separator\5\1\3\0\0\0\16LinePercent\0\rFileSize\1\0\0\1\0\1\14separator\5\1\3\0\0\0\rFileSize\0\15BufferType\1\0\0\1\0\1\14separator\5\0\1\2\0\0\17FileTypeName\15FileEncode\1\0\0\1\0\1\14separator\5\0\1\2\0\0\15FileEncode\15FileFormat\1\0\0\15section_fg\1\0\1\14separator\5\0\1\3\0\0\0\15FileFormat\0\rLineInfo\1\0\0\24separator_highlight\ngray2\1\0\2\14separator\6 \rprovider\15LineColumn\14GitBranch\1\0\0\1\0\0\0\fGitIcon\1\0\0\1\0\0\0\fGitRoot\1\0\0\24check_git_workspace\25galaxyline.condition\1\0\0\0\0\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\1\ticon\6-\17DiffModified\1\0\0\1\0\1\ticon\6~\fDiffAdd\1\0\0\1\0\1\ticon\6+\0\0\0\0\0\0\0\0\1\0\0\ngreen\1\0\1\ticon\n ÔÇÖ \bmid\19DiagnosticHint\1\0\0\tgrey\1\0\2\ticon\n ÔÇ≠ \rprovider\19DiagnosticHint\19DiagnosticInfo\1\0\0\tblue\1\0\2\ticon\n ÔÅö \rprovider\19DiagnosticInfo\19DiagnosticWarn\1\0\0\vorange\1\0\2\ticon\n ÔÅ± \rprovider\19DiagnosticWarn\20DiagnosticError\1\0\0\tred1\1\0\2\ticon\n ÔÅó \rprovider\20DiagnosticError\nSpace\1\0\0\1\0\0\0\1\0\0\vyellow\1\0\1\ticon\b Œª\rFileName\1\0\0\1\0\0\rFileIcon\1\0\0\15section_bg\18get_file_icon!galaxyline.provider_fileinfo\14condition\1\0\0\1\3\0\0\0\rFileIcon\0\vViMode\1\0\0\14highlight\1\4\0\0\0\0\tbold\rprovider\1\0\0\0\tleft\fCocFunc\14CocStatus\0\0\0\0\0\0\0\0\0\0\0\0\0\1\0\15\vpurple\f#c678dd\rdarkgrey\f#5c6370\ngreen\f#98c379\ngray3\f#3e4452\tblue\f#61afef\15section_bg\f#38393f\ngray1\f#5c6370\vyellow\f#e5c07b\ngray2\f#2c323d\afg\f#aab2bf\tred2\f#be5046\tred1\f#e06c75\tgrey\f#848586\vorange\f#e5c07b\15middlegrey\f#8791A5\abg\15background\b#%x\vformat\vstring\afg\15foreground\15StatusLine\24nvim_get_hl_by_name\bapi\bvim\1\6\0\0\tdefx\rpackager\nvista\rNvimTree\17coc-explorer\20short_line_list\fsection\0\0\15galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: zero.nvim
time([[Config for zero.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tzero\frequire\0", "config", "zero.nvim")
time([[Config for zero.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\nµ\1\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\1\rfiletype\rNvimTree\1\0\2\25middle_mouse_command\16bdelete! %d\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdiffview\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n…\5\0\2\b\2\22\0;6\2\0\0'\4\1\0B\2\2\0029\2\2\2B\2\1\1-\2\0\0\18\4\1\0'\5\3\0'\6\4\0B\2\4\1-\2\1\0\18\4\1\0'\5\5\0'\6\6\0'\a\a\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\b\0'\a\t\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\n\0'\a\v\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\f\0'\a\r\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\14\0'\a\15\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\16\0'\a\17\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\18\0'\a\19\0B\2\5\1-\2\1\0\18\4\1\0'\5\5\0'\6\20\0'\a\21\0B\2\5\1K\0\1\0\1¿\0¿<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>\r<space>e+<cmd>lua vim.lsp.buf.code_action()<cr>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<cr>\t<f2>J<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>\14<space>wl.<cmd>lua vim.lsp.buf.implementation()<cr>\agi%<cmd>lua vim.lsp.buf.hover()<cr>\n<c-i>*<cmd>lua vim.lsp.buf.definition()<cr>\agd+<cmd>lua vim.lsp.buf.declaration()<cr>\agD\6n\27v:lua.vim.lsp.omnifunc\romnifunc\14on_attach\18lsp_signature\frequireπ\1\0\0\n\1\b\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0B\0\1\0026\1\4\0\18\3\0\0B\1\2\4H\4\tÄ6\6\0\0'\b\5\0B\6\2\0028\6\5\0069\6\2\0065\b\6\0-\t\0\0=\t\a\bB\6\2\1F\4\3\3R\4ıK\0\1\0\2¿\14on_attach\1\0\0\14lspconfig\npairs\22installed_servers\nsetup\15lspinstall\frequire5\0\0\3\1\3\0\a-\0\0\0B\0\1\0016\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\3¿\fbufdo e\bcmd\bvimè\1\1\0\a\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\1\0B\1\2\0029\1\3\0013\2\4\0003\3\5\0\18\4\3\0B\4\1\0016\4\0\0'\6\6\0B\4\2\0023\5\b\0=\5\a\0042\0\0ÄK\0\1\0\0\22post_install_hook\15lspinstall\0\0\vbufset\vbufmap\nutils\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\17map_complete\2$nvim-autopairs.completion.compe\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\3\0\0\n<C-d>\n<C-u>\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: range-highlight.nvim
time([[Config for range-highlight.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20range-highlight\frequire\0", "config", "range-highlight.nvim")
time([[Config for range-highlight.nvim]], false)
-- Config for: goto-preview
time([[Config for goto-preview]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vheight\3\30\nwidth\3x\nsetup\17goto-preview\frequire\0", "config", "goto-preview")
time([[Config for goto-preview]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0 undotree_SetFocusWhenToggle\6g\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nü\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mkdir.nvim
time([[Config for mkdir.nvim]], true)
try_loadstring("\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0", "config", "mkdir.nvim")
time([[Config for mkdir.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-ts-rainbow
time([[Config for nvim-ts-rainbow]], true)
try_loadstring("\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\frainbow\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-rainbow")
time([[Config for nvim-ts-rainbow]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\27colorscheme tokyonight\17nvim_command\bapi\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\nÌ\2\0\0\a\0\18\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0\18\1\0\0'\3\b\0'\4\t\0'\5\n\0005\6\v\0B\1\5\1\18\1\0\0'\3\b\0'\4\f\0'\5\r\0005\6\14\0B\1\5\1\18\1\0\0'\3\b\0'\4\15\0'\5\16\0005\6\17\0B\1\5\1K\0\1\0\1\0\1\texpr\2\27compe#confirm('<c-e>')\n<c-e>\1\0\1\texpr\2\26compe#confirm('<cr>')\t<cr>\1\0\1\texpr\2\21compe#complete()\14<c-space>\6i\bmap\nutils\vsource\1\0\0\1\0\n\vbuffer\2\tpath\2\ttags\2\ftabnine\2\14ultisnips\2\rnvim_lua\2\tomni\1\tcalc\2\rnvim_lsp\2\nspell\2\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: lsp-rooter.nvim
time([[Config for lsp-rooter.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15lsp-rooter\frequire\0", "config", "lsp-rooter.nvim")
time([[Config for lsp-rooter.nvim]], false)
-- Config for: nvim-toggleterm.lua
time([[Config for nvim-toggleterm.lua]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14direction\nfloat\17open_mapping\v<c-t>t\nsetup\15toggleterm\frequire\0", "config", "nvim-toggleterm.lua")
time([[Config for nvim-toggleterm.lua]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapOpen lua require("packer.load")({'nvim-minimap'}, { cmd = "MinimapOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Silicon lua require("packer.load")({'vim-silicon'}, { cmd = "Silicon", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'nvim-minimap'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'surround.nvim', 'ultisnips', 'format.nvim', 'nvim-tree.lua', 'kommentary', 'telescope.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
