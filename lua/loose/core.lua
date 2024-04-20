local theme = require('loose.theme')

local core = {}

local function set_hl(group, colors)
  local hl = {}

  if colors.link then
    hl['link'] = colors.link
  else
    if colors.fg then
      hl['fg'] = colors.fg
    end
    if colors.bg then
      hl['bg'] = colors.bg
    end
    if colors.sp then
      hl['sp'] = colors.sp
    end
    if colors.style and colors.style ~= 'NONE' then
      for i in string.gmatch(colors.style, '[^,]+') do
        hl[i] = true
      end
    end
  end

  vim.api.nvim_set_hl(0, group, hl)
end

function core.load(colors, exec_autocmd)
  local opts = require('loose.config').options

  if vim.g.colors_name then
    vim.cmd.highlight('clear')
  end

  if vim.fn.exists('syntax_on') then
    vim.cmd.syntax('reset')
  end

  vim.go.background = opts.background
  vim.go.termguicolors = true
  vim.g.colors_name = 'loose'

  local highlights = vim.tbl_extend('force', theme.highlights(colors, opts), opts.custom_highlights)

  for group, color in pairs(highlights) do
    set_hl(group, color)
  end

  if opts.fade_tr then
    vim.cmd.highlight('Normal guibg=NONE')
    vim.cmd.highlight('LineNr guibg=NONE')
    vim.cmd.highlight('SignColumn guibg=NONE')
  end

  theme.load_terminal()

  if exec_autocmd then
    vim.cmd.doautocmd('<nomodeline> ColorScheme')
  end
end

return core
