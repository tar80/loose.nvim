local colors = {
  fg = '#8F8F8F',
  bg = '#000000',
  high_gray = '#AEAEAE',
  gray = '#8C8C8C',
  low_gray = '#646464',
  high_blue = '#718AA2',
  blue = '#63778A',
  low_blue = '#414E5B',
  high_cyan = '#87ACAC',
  cyan = '#638484',
  low_cyan = '#4B5F5F',
  high_green = '#88AD95',
  green = '#6F8B76',
  low_green = '#4B6956',
  high_olive = '#ABAB8D',
  olive = '#8E8D7D',
  low_olive = '#636653',
  high_orange = '#BBA288',
  orange = '#978474',
  low_orange = '#706559',
  high_red = '#BF8392',
  red = '#82606E',
  low_red = '#5F484E',
  high_purple = '#906D9B',
  purple = '#7B687F',
  low_purple = '#544559',
  shade_gray = '#101010',
  shade_blue = '#0D121A',
  shade_cyan = '#091313',
  shade_green = '#0B150F',
  shade_olive = '#13140B',
  shade_orange = '#1B140C',
  shade_red = '#1D0F12',
  shade_purple = '#160C19',

  diff_add = '#141d2f',
  diff_change = '#0e200e',
  diff_remove = '#290b18',
  diff_text = '#95e295',
  diff_text_bg = '#2a4d2a',

  nc = '#0C0D0D',
  float = '#191C1E',
  border = '#303737',
  selection = '#151C1E',
  highlight = '#17100E',
}

colors.error = colors.high_red
colors.warn = colors.high_orange
colors.info = colors.high_blue
colors.hint = colors.high_purple
colors.ok = colors.high_green

colors.match = colors.high_blue
colors.matchsub = colors.low_blue

colors.statusline = {
  fg = '#C4C4C4',
  fg2 = '#6A6A6A',
  bg = '#282828',
  bg2 = '#14141a',
  cyan = colors.high_cyan,
  blue = colors.high_blue,
  green = colors.high_green,
  olive = colors.high_olive,
  orange = colors.high_orange,
  red = colors.high_red,
  purple = colors.high_purple,
}

return colors
