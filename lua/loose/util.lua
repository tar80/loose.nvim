local util = {}

---@alias Ratio integer Percentage to increace or decreace
---@alias Background string "light"|"dark" Underlying file name of the color
---@alias RGB string RGB color code
---@alias Decimal integer Decimal color value
---@alias Red Decimal
---@alias Green Decimal
---@alias Blue Decimal

local MSG_TITLE = 'loose.nvim'
local feline_ex = {
  '}',
  'M.vi_mode = {',
  '  NORMAL = M.theme.fg,',
  '  INSERT = M.theme.cyan,',
  '  REPLACE = M.theme.orange,',
  '  OP = M.theme.red,',
  '  VISUAL = M.theme.purple,',
  '  LINES = M.theme.purple,',
  '  BLOCK = M.theme.purple,',
  '  ["V-REPLACE"] = M.theme.purple,',
  '  ENTER = M.theme.cyan,',
  '  MORE = M.theme.cyan,',
  '  SELECT = M.theme.red,',
  '  COMMAND = M.theme.green,',
  '  SHELL = M.theme.green,',
  '  TERM = M.theme.blue,',
  '  NONE = M.theme.red,',
  '}',
  'return M',
}

local staline_ex = {
  '}',
  'M.vi_mode = {',
  '  ["n"] = M.theme.fg,',
  '  ["niI"] = M.theme.green,',
  '  ["niR"] = M.theme.red,',
  '  ["niV"] = M.theme.red,',
  '  ["no"] = M.theme.fg,',
  '  ["nov"] = M.theme.fg,',
  '  ["noV"] = M.theme.fg,',
  '  ["no"] = M.theme.fg,',
  '  ["i"] = M.theme.green,',
  '  ["ic"] = M.theme.green,',
  '  ["ix"] = M.theme.green,',
  '  ["s"] = M.theme.red,',
  '  ["S"] = M.theme.red,',
  '  ["R"] = M.theme.red,',
  '  ["Rv"] = M.theme.red,',
  '  ["v"] = M.theme.purple,',
  '  ["V"] = M.theme.purple,',
  '  [""] = M.theme.purple,',
  '  ["vs"] = M.theme.purple,',
  '  ["Vs"] = M.theme.purple,',
  '  ["s"] = M.theme.purple,',
  '  ["r"] = M.theme.cyan,',
  '  ["r?"] = M.theme.cyan,',
  '  ["c"] = M.theme.cyan,',
  '  ["t"] = M.theme.cyan,',
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
  if #rgb > 6 then
    rgb = rgb:sub(-6)
  end
  local xr, xg, xb = rgb:sub(1, 2), rgb:sub(3, 4), rgb:sub(5, 6)
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

local function loose_dir()
  local source = debug.getinfo(1, 'S').source
  return source:gsub('@(.*)%/[^%/]+$', '%1')
end

---Get the path of `name`.lua
---@param name? string
---@return string # Path of the colorscheme palette
---@return string # Path of the feline theme
---@return string # Path of the staline theme
local function get_path(name)
  local loose_root = loose_dir()
  local lua_dir = loose_root:gsub('^(.*)%/[^%/]+$', '%1')
  name = name and string.format('%s.lua', name) or ''
  local palette = string.format('%s/colors/user/%s', loose_root, name)
  local feline_theme = string.format('%s/feline/themes/%s', lua_dir, name)
  local staline_theme = string.format('%s/staline/themes/%s', lua_dir, name)

  return palette, feline_theme, staline_theme
end

---Export `highlights` to `path`
---@param path string
---@param highlights table
local function write(path, highlights)
  local handle, message = io.open(path, 'w')

  if not handle then
    vim.notify(string.format('[%s] %s', MSG_TITLE, message), vim.log.levels.ERROR, { title = MSG_TITLE })
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
  if name == 'light' or name == 'dark' or name == 'muted' or name == 'faded' or name:find('^user', 1, true) == 1 then
    local msg = ('[%s] The name "%s" is not allowed. Because it is used as the default template name.'):format(MSG_TITLE, name)
    vim.api.nvim_err_writeln(msg)
    return
  end

  local ok, colors = pcall(require, ('loose.colors.%s'):format(template))
  if not ok then
    local msg = string.format('[loose] Error: could not read template "%s"', template)
    vim.api.nvim_err_writeln(msg)
    return
  end
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
    if c == 'statusline' then
      for fc, fv in pairs(colors.statusline) do
        xr, xg, xb = split_rgb(fv)
        if fc == 'nc' then
          table.insert(theme, string.format(fmt, fc, combine(xr, xg, xb, dr, dg, db)))
        else
          table.insert(theme, string.format(fmt, fc, combine(xr, xg, xb, dr_, dg_, db_)))
        end
      end
    elseif c ~= 'none' then
      xr, xg, xb = split_rgb(v)
      if rgx:match_str(c) then
        table.insert(hl, string.format(fmt, c, combine(xr, xg, xb, dr, dg, db)))
      else
        table.insert(hl, string.format(fmt, c, combine(xr, xg, xb, dr_, dg_, db_)))
      end
    end
  end

  local palette, feline_theme, staline_theme = get_path(name)
  write(palette, vim.list_extend(hl, { '}', 'return colors' }))

  if colors.statusline then
    local theme_ = vim.deepcopy(theme)
    write(feline_theme, vim.list_extend(theme, feline_ex))
    write(staline_theme, vim.list_extend(theme_, staline_ex))
  end

  vim.notify(string.format('[%s] create %s.lua', MSG_TITLE, name), vim.log.levels.INFO, { title = MSG_TITLE })
end

---Delete user theme
function util.delete_theme()
  local palette, feline_theme, staline_theme = get_path()
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
    local feline_theme_path = vim.fs.joinpath(feline_theme, choice)
    local staline_theme_path = vim.fs.joinpath(staline_theme, choice)

    if vim.fn.filereadable(feline_theme_path) == 1 then
      err = err == 1 and err or vim.fn.delete(feline_theme_path)
    end

    if vim.fn.filereadable(staline_theme_path) == 1 then
      err = err == 1 and err or vim.fn.delete(staline_theme_path)
    end

    if err == 1 then
      local msg = string.format('[%s] Could not delete files', MSG_TITLE)
      vim.notify(msg, vim.log.levels.ERROR)
    end
  end)
end

---Estimate the background brightness
---@param name string
---@return string BackGround
local function estimate_bg_lightness(name)
  local colors = require(require('loose.colors').get_palette_name(name))
  local r, g, b = split_rgb(colors.bg or vim.o.background)
  local lightness = (r * 0.2126) + (g * 0.7152) + (b * 0.0722)
  return lightness > 127.5 and 'light' or 'dark'
end

---@return string[]
local function get_completion_list()
  local list = { 'light', 'dark', 'muted', 'faded' }
  local user_dir = string.format('%s/colors/user', loose_dir())
  vim.fs.find(function(name, _)
    if name:find('.lua', 2, true) then
      table.insert(list, name:sub(1, -5))
    end
    return false
  end, { limit = math.huge, type = 'file', path = user_dir })
  return list
end

---Switch light and dark color settings
function util.enable_usercmd()
  local comp_list = get_completion_list()
  vim.api.nvim_create_user_command('LooseSwitch', function(cmd)
    local options = require('loose.config').options
    local name, bg
    if cmd.fargs[1] then
      name = vim.trim(cmd.args)
      bg = estimate_bg_lightness(name)
    else
      bg = vim.go.background == 'light' and 'dark' or 'light'
      name = options.theme[bg]
    end
    options.background = bg
    require('loose').load(name)
  end, {
    desc = 'Switch loose themes',
    nargs = '?',
    complete = function(a, _, _)
      return vim.tbl_filter(function(item)
        return vim.startswith(item, a)
      end, comp_list)
    end,
  })
end

return util
