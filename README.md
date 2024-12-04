![logo](https://github.com/user-attachments/assets/6c56a5c2-4b07-4728-8b1b-71777829f0a0)

![theme](https://github.com/user-attachments/assets/8d44ac3f-51fd-44dd-b440-ca0f5cf18b6d)

<!-- ![logo](https://github.com/tar80/test/assets/45842304/6649eafa-0e4d-4468-9060-fa5d94e72aa2) -->

## Requirements

- Neovim >= 0.10.0

## Features

Loose has a function to output the palettes (theme) that matches the background color.  
Since the difference from the default background color is only increased or decreased,  
the colors do not always appear beautifully.

![create_theme](https://github.com/user-attachments/assets/cfa8536f-151d-4f60-9c14-a3217e85d6ce)
<!-- ![sample](https://github.com/tar80/test/assets/45842304/0be2c3dd-9cf5-4cb3-9c5d-58f809261062) -->

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
- [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) @deprecated
- [Nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [Matchwith](https://github.com/tar80/matchwith.nvim)
- [Skkeleton_indicator](https://github.com/delphinus/skkeleton_indicator.nvim)
- [Staline](https://github.com/tamton-aquib/staline.nvim)
- [Vim-sandwich](https://github.com/machakann/vim-sandwich)
- [Rainbow-delimiters](https://gitlab.com/HiPhish/rainbow-delimiters.nvim)

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

## Configuration

> [!NOTE]
>
> - Added `enable_usercmd`. This registers the command `LooseSwitch`
> - `theme` option has been deparecated. and split into `light_theme` and `dark_theme`
> - Added `depricated` into `styles` option
> - Added `statusline`,`tabline`,`tabsel`,`tabfill` into `disable` option
> - Added `lsp_semantic` into `plugins` option
> - Added `flash.nvim` highlights
> - Added global valiable `g:loose_theme`. The current theme name will be saved

> [!IMPORTANT]
>
> - Colorscheme is no longer loaded during `loose.setup()`.  
>   Execute `Colorscheme loose` to load the colorscheme.
> - `custom_highlights` has been changed so that it can be set per background.  

<details>
<summary> Click to see default configuration </summary>

```lua
require("loose").setup({
    enable_usercmd = false, -- Enable user command "LooseSwitch"
    background = "dark", -- Background color applied at strtup. "light"|"dark"
    @depricated theme = "dark", -- A palette name
    light_theme = "light", -- A light palette name
    dark_theme = "dark", -- A dark palette name
    borders = true, -- Enable split window borders
    fade_nc = false, -- Change the background color of other buffers
    fade_tr = false, -- Transparent background of current buffer while changing background color of other buffers
    -- "NONE"|"[bold][,underline][,italic][,...]"]
    styles = {
        comments = "NONE",
        strings = "NONE",
        keywords = "NONE",
        functions = "NONE",
        variables = "NONE",
        diagnostics = "undercurl",
        references = "underline",
        spell = "undercurl",
        depricated = "NONE",
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
    -- highlight_group = {fg = "white", bg = "black", style = "underline"}
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
        skkeleton_indicator = false,
        sandwich = false,
        cmp = false,
        telescope = false, -- If "border_fade" is specified, the border background fades
        trouble = false,
        -- non maintained
        barbar = false,
        bufferline = false,
        confliet_marker = false,
        dashboard = false,
        fern = false,
        fuzzy_motion = false,
        hop = false,
        indent_blankline = false,
        illuminate = false,
        lightspeed = false,
        lspsaga = false,
        navic = false
        notify = false,
        neogit = false,
        nvimtree = false,
        rainbow_delimiters_high = false, -- Rainbow Delimiters can choose one of
        rainbow_delimiters_low = false,  -- either high contrast or low contrast
        sneak = false,
        treesitter_context = false,
        whichkey = false,
    }
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
