local colors = {
  fg = '#434343',
  bg = '#FFFFFF',
  high_gray = '#2E2E2E',
  gray = '#7B7B7B',
  low_gray = '#AFAFAF',
  high_blue = '#3B84DF',
  blue = '#45648F',
  low_blue = '#8094C7',
  high_cyan = '#52B7D8',
  cyan = '#4A8A87',
  low_cyan = '#75B3BD',
  high_green = '#6FAC33',
  green = '#628A47',
  low_green = '#7EA368',
  high_olive = '#CFAC2F',
  olive = '#988D4F',
  low_olive = '#B6AA6D',
  high_orange = '#FF7B3C',
  orange = '#D6732E',
  low_orange = '#DB9368',
  high_red = '#f95874',
  red = '#C46272',
  low_red = '#D47F89',
  high_purple = '#E136EA',
  purple = '#95628E',
  low_purple = '#B37BB5',
  shade_gray = '#EEEEEE',
  shade_blue = '#EBF5F9',
  shade_cyan = '#E5FEFD',
  shade_green = '#E6FECD',
  shade_olive = '#FBFEBD',
  shade_orange = '#FEF0DD',
  shade_red = '#FEECEE',
  shade_purple = '#FBE3FE',

  diff_add = '#c2defe',
  diff_change = '#d1fcc3',
  diff_remove = '#fecad0',
  diff_text = '#f7feea',
  diff_text_bg = '#8ccb80',

  nc = '#F7F7FB',
  highlight = '#FEF2D5',
  float = '#F1F4E7',
  border = '#C8C8C8',
  selection = '#DADDDE',
}

colors.error = colors.high_red
colors.warn = colors.high_olive
colors.info = colors.high_blue
colors.hint = colors.high_purple
colors.ok = colors.high_green

colors.match = colors.high_blue
colors.matchsub = colors.low_blue

colors.statusline = {
  fg = '#4F4F4F',
  fg2 = '#859387',
  bg = '#F1F1F1',
  bg2 = '#D0D0D0',
  cyan = colors.high_cyan,
  blue = colors.high_blue,
  green = colors.high_green,
  olive = colors.high_olive,
  orange = colors.high_orange,
  red = colors.high_red,
  purple = colors.high_purple,
}

return colors
