local loose = {}
local config = require('loose.config')
local theme = require('loose.theme')

local function set_hl(group, colors)
  local hl = {}
  if colors.link then
    hl['link'] = colors.link
  else
    hl['fg'] = colors.fg
    hl['bg'] = colors.bg
    hl['sp'] = colors.sp
    if colors.style and colors.style:lower() ~= 'none' then
      for v in colors.style:gmatch('[^,]+') do
        hl[v] = true
      end
    end
  end
  vim.api.nvim_set_hl(0, group, hl)
end

---Setup loose
---@param opts table User-specified option values
function loose.setup(opts)
  local enable_usercmd = config.set_options(opts).enable_usercmd
  if enable_usercmd then
    require('loose.util').enable_usercmd()
  end
end

---Load loose highlights
---@param name? string Palette name
function loose.load(name)
  local theme_name, colors = require('loose.colors').load(name)
  if not colors.shade_gray then
    local msg = {
      '[loose.nvim] The palette has been updated. Please run',
      ('`lua require("loose.util").create_theme("%s",theme,background,"%s")`'):format(theme_name, colors.bg),
    }
    vim.notify_once(table.concat(msg, '\n'), vim.log.levels.WARN, { opts = 'loose-nvim' })
  end
  local options = config.options
  if vim.g.colors_name then
    vim.g.colors_name = nil
    vim.cmd.highlight('clear')
  end
  if vim.fn.exists('syntax_on') then
    vim.cmd.syntax('reset')
  end
  if options.background then
    vim.go.background = options.background
    options.background = nil
  end
  vim.go.termguicolors = true
  vim.g.colors_name = 'loose'
  vim.g.loose_theme = theme_name
  local custom_highlights = options.custom_highlights[vim.go.background] or options.custom_highlights
  if options.fade_tr then
    custom_highlights['Normal'] = { guibg = 'NONE' }
    custom_highlights['LineNr'] = { guibg = 'NONE' }
    custom_highlights['SignColumn'] = { guibg = 'NONE' }
  end
  local highlights = vim.tbl_extend('force', theme.highlights(colors, options), custom_highlights)
  for group, color in pairs(highlights) do
    set_hl(group, color)
  end
  theme.load_terminal()
  vim.cmd.doautocmd('<nomodeline> ColorScheme')
end

---Get loose colors
---@param name string Palette name
---@return {[string]: string} `Color palette`
function loose.get_colors(name)
  if not name then
    name = config.options.background == 'light' and config.options.theme.light or config.options.theme.dark
  end
  local palette = require('loose.colors').get_palette_name(name)
  return require(palette)
end

---Get all colors in the palette
---@param name string Palette name
---@return string[] `Colors`
function loose.get_palette(name)
  local colors = loose.get_colors(name)
  local seen = {}
  return vim
    .iter(colors)
    :map(function(_, v)
      if not seen[v] then
        seen[v] = true
        if type(v) == 'string' and v:find('#', 1, true) then
          return v
        end
      end
    end)
    :totable()
end

return loose
