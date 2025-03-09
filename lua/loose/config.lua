local config = {}
local _options = {
  enable_usercmd = false,
  background = nil,
  theme = { light = 'light', dark = 'dark' },
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  fade_tr = false, -- Enables fade_nc and makes the current background transparent
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = 'NONE',
    deprecated = 'NONE',
    diagnostics = 'undercurl',
    functions = 'NONE',
    keywords = 'NONE',
    references = 'underline',
    spell = 'undercurl',
    strings = 'NONE',
    variables = 'NONE',
    virtualtext = 'NONE',
  },
  disable = {
    background = false, -- Disable setting the background color. This is override fade_nc
    cursorline = false, -- Disable the cursorline
    eob_lines = false, -- Hide the end-of-buffer lines
    statusline = false, -- Disable setting the statusline background color.
    tabline = false, -- Disable setting the tabline background color.
    tabsel = false, -- Disable setting the tablineSel background color.
    tabfill = false, -- Disable setting the tablineFill background color.
  },
  -- Override default highlight groups
  custom_highlights = {},
  plugins = { lsp = true, lsp_semantic = true, treesitter = true },
}

---@param opts table User-specified option values
---@return table - Options
function config.set_options(opts)
  config.options = vim.tbl_deep_extend('force', _options, opts or {})
  if type(opts.theme) ~= 'table' then
    opts.theme = { light = 'light', dark = 'dark' }
    vim.deprecate('[loose.nvim] Option "theme"', '"theme.light" and "theme.dark"', 'course.', 'due', false)
  end
  return config.options
end

return config
