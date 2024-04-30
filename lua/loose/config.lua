local config = {}
config.options = {
  background = 'dark',
  theme = 'dark',
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  fade_tr = false, -- Enables fade_nc and makes the current background transparent
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = 'NONE',
    strings = 'NONE',
    keywords = 'NONE',
    functions = 'NONE',
    variables = 'NONE',
    diagnostics = 'undercurl',
    references = 'underline',
    spell = 'undercurl',
    virtualtext = 'NONE',
  },
  disable = {
    background = false, -- Disable setting the background color. This is override fade_nc
    cursorline = false, -- Disable the cursorline
    eob_lines = false, -- Hide the end-of-buffer lines
  },
  -- Override default highlight groups
  custom_highlights = {},
  plugins = { lsp = true, treesitter = true },
}

function config.set_options(opts)
  if not opts then
    return {}
  end

  vim.validate({
    background = { opts.background, 'string', true },
    theme = { opts.theme, 'string', true },
    borders = { opts.borders, 'boolean', true },
    fade_nc = { opts.fade_nc, 'boolean', true },
    fade_tr = { opts.fade_tr, 'boolean', true },
    styles = { opts.styles, 'table', true },
    disable = { opts.disable, 'table', true },
    custom_highlights = { opts.custom_highlights, 'table', true },
    plugins = { opts.plugins, 'table', true },
  })

  config.options = vim.tbl_deep_extend('force', config.options, opts)
end

return config
