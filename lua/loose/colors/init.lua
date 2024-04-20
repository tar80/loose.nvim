local M = {}

function M.color(name)
  local rgx = vim.regex[=[^\(light\|\|dark\|user\)$]=]

  if not rgx:match_str(name) then
    name = string.format('user.%s', name)
  end

  return string.format('loose.colors.%s', name)
end

function M.load()
  local opts = require("loose.config").options
  local theme = opts.theme
  local ok, contents = pcall(require, M.color(theme))

  if not ok then
    local msg = string.format('[loose] theme %s is not exists', theme)
    vim.notify(msg, vim.log.level.ERROR)
  end

  return contents
end

return M
