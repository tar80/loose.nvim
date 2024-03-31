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
    diagnostics = 'underline',
    references = 'underline',
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

-- config.options = {}

function config.set_options(opts)
  config.options = vim.tbl_deep_extend('force', config.options, opts or {})
end

-- config.set_options(defaults)

return config
