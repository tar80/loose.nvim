# loose.nvim

![logo](https://github.com/tar80/test/assets/45842304/6649eafa-0e4d-4468-9060-fa5d94e72aa2)

## Features

Loose has a function to output a palette (theme) that matches the background color.  
Since the difference from the default background color is only increased or decreased,  
colors does not always come out beautifully.  

![sample](https://github.com/tar80/test/assets/45842304/0be2c3dd-9cf5-4cb3-9c5d-58f809261062)

You can choose between the `light` template and the `dark` template. If `user.lua` exists in the
`loose/lua/loose/color` directory, you can also select `user` in the template.
If you need the user template, create one by copying another template.  
If the template has a `colors.feline` table, a Feline theme with the same name will also be output.  

```lua
---Create user color palette
---@param name string Palette name
---@param template string Template name "light"|"dark"|"user"
---@param bakground string Base background color "light"|"dark"
---@param rgb string Specify the background color in the format "#rrggbb"
require('loose.util').create_theme(name, temlate, background, rgb)

---Delete user color palette
require('loose.util').delete_theme()

---Color palette reference
local colors = require('loose').colors(name)
vim.print(colors)
```

Each color consists of three types: high, normal and low,
and eight colors: gray, blue, cyan, green, olive, orange, red, and purple.
i.e. `high_xxx`, `xxx`, `low_xxx`

### Plugin Support

Loose comes with some plugin highlights preset. These are disabled, but can be optionally enabled.  
In addition to the highlight settings built into the base `onenord.nvim`,
the author's favorite plugins are also added.  

- [Feline](https://github.com/feline-nvim/feline.nvim)
- [Fret](https://github.com/tar80/fret.nvim)
- [Fuzzy-motion](https://github.com/yuki-yano/fuzzy-motion.vim)
- [Lazy](https://github.com/folke/lazy.nvim)
- [Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [Skkeleton_indicator](https://github.com/delphinus/skkeleton_indicator.nvim)
- [Vim-sandwich](https://github.com/machakann/vim-sandwich)
- [rainbow-delimiters.nvim](https://gitlab.com/HiPhish/rainbow-delimiters.nvim)

## Configuration

```lua
require("loose").setup({
    background = "dark", -- A base background color. "light"|"dark"
    theme = "dark", -- A palette name
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
        virtualtext = "NONE",
    },
    disable = {
        background = false, -- Remove background color and enable transparency (fade_xx is ignored)
        cursorline = false,
        eob_lines = false
    },
    -- Override or add to default settings. See `nvim_set_hl()` for details.
    -- highlight_group = {fg = "white", bg = "black", style = "underline"}
    custom_highlights = {},
    plugins = {
        lsp = true,
        treesitter = true,
        treesitter_context = false,
        confliet_marker = false,
        fret = false,
        fuzzy_motion = false,
        skkeleton_indicator = false,
        sandwich = false,
        lazy = false,
        lspconfig = false,
        cmp = false,
        dashboard = false,
        notify = false,
        trouble = false,
        rainbow_delimiters_high = false, -- Rainbow Delimiters can choose one of
        rainbow_delimiters_low = false,  -- either high contrast or low contrast
        neogit = false,
        gitsigns = false,
        telescope = false, -- If "border_fade" is specified, the border background fades
        nvimtree = false,
        whichkey = false,
        lspsaga = false,
        bufferline = false,
        barbar = false,
        sneak = false,
        indent_blankline = false,
        dap = false,
        dap_virtual_text = false,
        illuminate = false,
        hop = false,
        fern = false,
        lightspeed = false,
        navic = false
    }
})
```

## Statusline

To use Feline's color theme, do the following:  

```lua
local colors = require("feline.themes.<palette name>")

require("feline").setup({
  theme = colors.theme,
  vi_mode_colors = colors.vi_mode,
})
```

Please refer to the file in `feline/themes` for available colors.  

## Credit

loose.nvim was created based on onenord.nvim.  

- [rmehri01/onenord.nvim](https://github.com/rmehri01/onenord.nvim)
