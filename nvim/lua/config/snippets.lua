local config = function()
  require("snippets").use_suggested_mappings(true)

  require("snippets").snippets = {
    _global = {
      today = function()
        return os.date("%Y/%m/%d")
      end
    },
    go = {
      ["for"] = "if err := $1; err != nil {$2}",
      ["if"] = "if err := $1; err != nil {$2}",
      pkgm = [[package main

func main() {
  $1
}]]
    }
  }
end

return {config = config}
