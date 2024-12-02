local M = {}

---Get palette name
---@param name string
---@return string `Palette name`
function M.get_palette_name(name)
  local has_palette = vim.iter({ 'light', 'dark', 'muted', 'faded', 'user' }):find(name)
  if not has_palette then
    name = string.format('user.%s', name)
  end
  return string.format('loose.colors.%s', name)
end

---Get highlights details
---@param name? string Palette name
---@return string, table `Color theme`, `Color palette`
function M.load(name)
  if not name then
    local options = require('loose.config').options
    local background = options.background or vim.go.background
    name = background == 'light' and options.theme.light or options.theme.dark
  end
  ---@type boolean, table
  local ok, colors = pcall(require, M.get_palette_name(name))
  if not ok then
    local msg = ('[loose.nvim] The theme %s is not exists'):format(name)
    vim.notify(msg, vim.log.levels.ERROR)
  end
  return name, colors
end

return M
