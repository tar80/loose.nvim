# ![logo](https://github.com/user-attachments/assets/6c56a5c2-4b07-4728-8b1b-71777829f0a0)

![theme](https://github.com/user-attachments/assets/8d44ac3f-51fd-44dd-b440-ca0f5cf18b6d)

![veil](https://github.com/user-attachments/assets/8efd6602-063c-404d-8fab-3a382193c914)

## Requirements

- Neovim >= 0.10.0

## Features

Loose has a function to output the palettes (theme) that matches the background color.
Since the difference from the default background color is only increased or decreased,
the colors do not always appear beautifully.

![create_theme](https://github.com/user-attachments/assets/cfa8536f-151d-4f60-9c14-a3217e85d6ce)

You can choose between the `light`, `dark`, `muted` and `faded` templates.
If `user.lua` exists in the `loose/lua/loose/color` directory, you can also select
`user` in the template.
If you need the user template, create one by copying another template.
If the template has a `colors.feline` table, a Feline theme with the same name
will also be output.

> [!WARNING]  
> `loose.colors()` has been renamed to `loose.get_colors()`

```lua
---Create user color palette
---@param name string Palette name
---@param template string Template name "light"|"dark"|"muted"|"faded"|"user"
---@param bakground string Base background color "light"|"dark"
---@param rgb string Specify the background color in the format "#rrggbb"
require('loose.util').create_theme(name, template, background, rgb)

---Delete user color palettes
require('loose.util').delete_theme()

---Color settings reference
---@param name string Palette name
---@return `table` {[name: string]: hex color code: string}
local colors = require('loose').get_colors(name)

---Get all color codes
---@param name string Palette name
---@return `string[]` hex color codes
local palette = require('loose').get_palette(name)
```

Each color consists of four types: high, normal, low and shade,
and eight colors: gray, blue, cyan, green, olive, orange, red, and purple.
That is, they are represented as high_xxx, xxx, low_xxx, and shade_xxx.

### Plugin Support

Loose comes with some preset plugin highlights. These are disabled by default
but can be optionally enabled.
In addition to the highlight settings built into the base `onenord.nvim`,
the author's favorite plugins are also added.

- [Feline](https://github.com/feline-nvim/feline.nvim)
- [Fret](https://github.com/tar80/fret.nvim)
- [Fuzzy-motion](https://github.com/yuki-yano/fuzzy-motion.vim)
- [Flash](https://github.com/folke/flash.nvim)
- [Lazy](https://github.com/folke/lazy.nvim)
- [Noice](https://github.com/folke/noice.nvim)
- [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) @deprecated
- [Nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [Matchwith](https://github.com/tar80/matchwith.nvim)
- [Mini-icons](https://github.com/echasnovski/mini.icons)
- [Mini-diff](https://github.com/echasnovski/mini.diff)
- [Rereope](https://github.com/tar80/rereope.nvim)
- [Skkeleton_indicator](https://github.com/delphinus/skkeleton_indicator.nvim)
- [Snacks](https://github.com/folke/snacks.nvim)
- [Staba](https://github.com/tar80/staba.nvim)
- [Staline](https://github.com/tamton-aquib/staline.nvim)
- [Vim-sandwich](https://github.com/machakann/vim-sandwich)
- [Rainbow-delimiters](https://gitlab.com/HiPhish/rainbow-delimiters.nvim)
- [Render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)

and

- [tiny-devicons-auto-colors.nvim](https://github.com/rachartier/tiny-devicons-auto-colors.nvim)
    <details>
    <summary> Click to see devicons override configuration </summary>

  ```lua
  local opts = {...} -- tiny-devicons-auto-colors options
  local ok, loose = pcall(require, 'loose')
  if ok then
    opts.colors = loose.get_palette()
    require('tiny-devicons-auto-colors').setup(opts)
  end
  ```

    </details>

### User plugins

To enable user-specific hlgroup settings, place a `<plugin_name>.lua` file in
the `lua/loose/user_plugins/` directory and add the `user_plugins` table to the
options. This allows you to customize hlgroups, whether by defining them for
plugins that Loose doesn't provide by default, or by modifying the existing ones.

For example, to modify the hlgroup for `lsp`, first create and edit the file
`lua/loose/user_plugins/lsp.lua`. Refer to the `lua/loose/user_plugins/.template`
file for the writing format. Next, exclude `lsp` from the `plugins` table, and
then add it to the `user_plugins` table.

```lua
opts = {
    plugins = { lsp = false },
    User_plugins = { lsp = true },
}
```

> [!IMPORTANT]
> Here's an example of what **not** to do:
>
> ```lua
> opts = {
>     plugins = { lsp = true },
>     User_plugins = { lsp = true },
> }
> ```
>
> This configuration is not allowed and will result in an error.
> This is to maintain a clear and consistent configuration, preventing potential
> issues and making it easier to understand and manage highlight settings.
> Therefore, the `user_plugins` option must configure the hlgroup for the entire
> plugin; partial application is not possible.

## Configuration

> [!IMPORTANT]
>
> - `custom_highlights` has been changed so that it can be set per theme-name.
> - Colorscheme is no longer loaded during `loose.setup()`.
>   Execute `Colorscheme loose` to load the colorscheme.

<details>
<summary> Click to see default configuration </summary>

```lua
require("loose").setup({
    enable_usercmd = false, -- Enable user command "LooseSwitch"
    background = "dark", -- Background color applied at strtup. "light"|"dark"
    light_theme = "light", -- A light palette name
    dark_theme = "dark", -- A dark palette name
    borders = true, -- Enable split window borders
    fade_nc = false, -- Change the background color of other buffers
    fade_tr = false, -- Transparent background of current buffer while changing background color of other buffers
    -- "NONE"|"[bold][,underline][,italic][,...]"]
    styles = {
        comments = "NONE",
        depricated = "NONE",
        diagnostics = "undercurl",
        functions = "NONE",
        keywords = "NONE",
        references = "underline",
        spell = "undercurl",
        strings = "NONE",
        variables = "NONE",
        virtualtext = "NONE",
    },
    disable = {
        background = false, -- Remove background color and enable transparency (fade_xx is ignored)
        cursorline = false,
        eob_lines = false,
        statusline = false,
        tabline = false,
        tabsel = false,
        tabfill = false,
    },
    -- Override or add to default settings. See `nvim_set_hl()` for details.
    -- [theme_name] = {hlgroup = {fg = "white", bg = "black", style = "underline"}}
    custom_highlights = {light = {}, dark = {}},
    plugins = {
        -- maintained
        lsp = true,
        lsp_semantic = true,
        treesitter = true,
        dap = false,
        dap_virtual_text = false,
        flash = false,
        fret = false,
        gitsigns = false,
        lazy = false,
        lspconfig = false, -- @deprecated: LspInfo has been updated. Hlgroup is no longer used
        matchwith = false,
        mini_icons = false,
        noice = false,
        render_markdown = false,
        rereope = false,
        skkeleton_indicator = false,
        sandwich = false,
        snacks = false,
        staba = false,
        cmp = false,
        telescope = false, -- If "border_fade" is specified, the border background fades
        trouble = false,

        -- non-maintenance
        barbar = false,
        bufferline = false,
        conflict_marker = false,
        dashboard = false,
        fern = false,
        fuzzy_motion = false,
        hop = false,
        indent_blankline = false,
        illuminate = false,
        lightspeed = false,
        lspsaga = false,
        mini_diff = false,
        navic = false
        notify = false,
        neogit = false,
        nvimtree = false,
        rainbow_delimiters_high = false, -- Rainbow Delimiters can choose one of
        rainbow_delimiters_low = false,  -- either high contrast or low contrast
        sneak = false,
        treesitter_context = false,
        whichkey = false,
    },
    -- User's own specified plugins highlight groups
    -- Set the plugin name and value in the same way as the "plugins" table
    -- You can also set a value other than nil or false and use it as a flag
    user_plugins = {},
})
```

</details>

## Statusline

To use statusline color theme, do the following:

<details>
<summary> Click to see load palette configuration </summary>

```lua
local set_palette = function(_)
    -- loose saves the name of the current color theme in g:loose_theme
    local theme = vim.g.loose_theme or vim.go.background
    palette = loose.get_colors(theme)
    local feline = require(('feline.themes.%s'):format(theme))
    palette = vim.tbl_deep_extend('force', palette, feline)

    -- local staline = require(('staline.themes.%s'):format(theme))
    -- palette = vim.tbl_deep_extend('force', palette, staline)
end

local palette = {}
local ok, loose = pcall(require, 'loose')

if ok then
    set_palette()

    local augroup = vim.api.nvim_create_augroup('loose', { clear = true })
    vim.api.nvim_create_autocmd('ColorScheme', {
    desc = 'Load color palette',
    group = augroup,
    callback = set_palette
    })
end

-- feline
require("feline").setup({
  theme = palette.theme,
  vi_mode_colors = palette.vi_mode,
})

-- staline
require('staline').setup({
  mode_colors = palette.vi_mod,
})
```

</details>

Please refer to the file in `staline/themes` or `feline/themes` for available colors.

## Command

`LooseSwitch [theme_name]`

This command is registered when the option `enable_usercmd` is set to `true`.
If theme_name is specified, it will be loaded, and the highlight will be updated.
If nothing is specified, the background color will switch between light and dark.

## Acknowledgments

loose.nvim is based on onenord.nvim.  
However, the color settings themselves are unique and do not depend on it.

- [rmehri01/onenord.nvim](https://github.com/rmehri01/onenord.nvim)
