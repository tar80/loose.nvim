local util = {}

---@alias Ratio integer Percentage to increace or decreace
---@alias Background string "light"|"dark" Underlying file name of the color
---@alias RGB string RGB color code
---@alias Decimal integer Decimal color value
---@alias Red Decimal
---@alias Green Decimal
---@alias Blue Decimal

local title = '[loose]'
local feline_ex = {
  '}',
  'M.vi_mode = {',
  '  NORMAL = M.theme.fg,',
  '  INSERT = M.theme.cyan,',
  '  REPLACE = M.theme.orange,',
  '  OP = M.theme.pink,',
  '  VISUAL = M.theme.purple,',
  '  LINES = M.theme.purple,',
  '  BLOCK = M.theme.purple,',
  '  ["V-REPLACE"] = M.theme.purple,',
  '  ENTER = M.theme.cyan,',
  '  MORE = M.theme.cyan,',
  '  SELECT = M.theme.pink,',
  '  COMMAND = M.theme.green,',
  '  SHELL = M.theme.green,',
  '  TERM = M.theme.blue,',
  '  NONE = M.theme.pink,',
  '}',
  'return M',
}

---Merge part of the RGB color and increment value
---@param intensity string Part of the RGB color code
---@return Decimal
local function hex_to_decimal(intensity)
  return tonumber(intensity, 16)
end

---Split RGB color code into parts
---@param rgb string RGB color code
---@return Red, Green, Blue
local function split_rgb(rgb)
  local xr, xg, xb = rgb:sub(2, 3), rgb:sub(4, 5), rgb:sub(6, 7)
  return hex_to_decimal(xr), hex_to_decimal(xg), hex_to_decimal(xb)
end

---Closure. Combine increment or decrement and color
---@param background string `"light"`|`"dark"`
---@return function # fun(xr: Red, xg: Green, xb: Blue, dr: Red, dg: Green, db: bule) return Red, Green, Blue
local function combine_color(background)
  local function fetch(lower, upper, origin, change)
    return (lower < upper) and origin or change
  end

  local func = {
    light = function(xr, xg, xb, dr, dg, db)
      local r, g, b = xr - dr, xg - dg, xb - db
      return fetch(r, 0, 0, r), fetch(g, 0, 0, g), fetch(b, 0, 0, b)
    end,
    dark = function(xr, xg, xb, dr, dg, db)
      local r, g, b = dr + xr, dg + xg, db + xb
      return fetch(255, r, 255, r), fetch(255, g, 255, g), fetch(255, b, 255, b)
    end,
  }

  return func[background]
end

---Get the path of `name`.lua
---@param name? string
---@return string # Path of the colorscheme palette
---@return string # Path of the feline theme
local function get_path(name)
  local source = debug.getinfo(1, 'S').source
  local loose_dir = source:gsub('@(.*)%/[^%/]+$', '%1')
  local lua_dir = loose_dir:gsub('^(.*)%/[^%/]+$', '%1')
  name = name and string.format('%s.lua', name) or ''
  local palette = string.format('%s/colors/user/%s', loose_dir, name)
  local theme = string.format('%s/feline/themes/%s', lua_dir, name)

  return palette, theme
end

---Export `highlights` to `path`
---@param path string
---@param highlights table
local function write(path, highlights)
  local handle, message = io.open(path, 'w')

  if not handle then
    vim.notify(string.format('%s %s', title, message), 4, { title = title })
    return
  end

  handle:write(table.concat(highlights, '\n'))
  handle:close()
end

---Create user theme
---@param name string Color name
---@param template string "light"|"dark"|"user"
---@param background string "light|"dark"
---@param rgb string RGB color code for Normal background
function util.create_theme(name, template, background, rgb)
  if name == 'light' or name == 'dark' or name == 'user' then
    local msg = string.format('Name %s is not allowed', name)
    vim.notify(msg, 4)
    return
  end

  local colors = require(string.format('loose.colors.%s', template))
  local dr, dg, db = split_rgb(rgb)
  local combine = combine_color(background)

  if background == 'light' then
    dr, dg, db = 255 - dr, 255 - dg, 255 - db
  end

  local dr_, dg_, db_ = math.floor(dr / 1.6), math.floor(dg / 1.6), math.floor(db / 1.6)
  ---@type integer, integer, integer
  local xr, xg, xb
  local rgx = vim.regex([[^\(nc\|highlight\|float\|boder\|\|selection\)]])
  local hl = { 'local colors = {' }
  local theme = { 'local M = {}', 'M.theme = {' }
  local fmt = '  %s = "#%02x%02x%02x",'

  for c, v in pairs(colors) do
    if c == 'feline' then
      for fc, fv in pairs(colors.feline) do
        xr, xg, xb = split_rgb(fv)
        table.insert(theme, string.format(fmt, fc, combine(xr, xg, xb, dr_, dg_, db_)))
      end
    elseif c ~= 'none' then
      xr, xg, xb = split_rgb(v)
      table.insert(
        hl,
        string.format(
          fmt,
          c,
          (function()
            if rgx:match_str(c) then
              return combine(xr, xg, xb, dr, dg, db)
            else
              return combine(xr, xg, xb, dr_, dg_, db_)
            end
          end)()
        )
      )
    end
  end

  local palette, feline_theme = get_path(name)
  write(palette, vim.list_extend(hl, { '}', 'return colors' }))

  if colors.feline then
    write(feline_theme, vim.list_extend(theme, feline_ex))
  end

  vim.notify(string.format('%s create %s.lua', title, name), 3, { title = title })
end

---Delete user theme
function util.delete_theme()
  local palette, feline_theme = get_path()
  local paths = {}

  for name, type in vim.fs.dir(palette, {}) do
    if type == 'file' and name ~= '.gitignore' then
      table.insert(paths, name)
    end
  end

  vim.ui.select(paths, {
    prompt = 'Select theme to delete:',
  }, function(choice)
    if not choice then
      return
    end

    local err = vim.fn.delete(vim.fs.joinpath(palette, choice))
    local path = vim.fs.joinpath(feline_theme, choice)

    if vim.fn.filereadable(path) == 1 then
      err = err == 1 and err or vim.fn.delete(path)
    end

    if err == 1 then
      local msg = string.format('%s Could not delete files', title)
      vim.notify(msg, 4)
    end
  end)
end

return util
