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
    background = false,
    cursorline = false,
    eob_lines = false,
    statusline = false,
    tabline = false,
    tabsel = false,
    tabfill = false,
  },
  -- Override default highlight groups
  custom_highlights = {},
  plugins = { lsp = true, lsp_semantic = true, treesitter = true },
  -- User's own specified plugins highlight groups
  user_plugins = {},
}

---@param opts table User-specified option values
---@param name string Unique name
---@return table - Options
function config.set_options(opts, name)
  config.options = vim.tbl_deep_extend('force', _options, opts or {})
  if type(opts.theme) ~= 'table' then
    opts.theme = { light = 'light', dark = 'dark' }
    vim.deprecate(
      ('[%s] Option "theme"'):format(name),
      '"theme.light" and "theme.dark"',
      'course.',
      'due',
      false
    )
  end
  return config.options
end

return config
