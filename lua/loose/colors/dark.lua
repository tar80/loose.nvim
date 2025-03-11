local colors = {
  fg = '#909090',
  bg = '#000000',
  high_gray = '#AFAFAF',
  gray = '#8D8D8D',
  low_gray = '#656565',
  high_blue = '#658DB6',
  blue = '#5B799A',
  low_blue = '#3C5066',
  high_cyan = '#77B4B3',
  cyan = '#568B8B',
  low_cyan = '#446363',
  high_green = '#7AB690',
  green = '#659272',
  low_green = '#407153',
  high_olive = '#ADAE7D',
  olive = '#908E76',
  low_olive = '#64684A',
  high_orange = '#C9A175',
  orange = '#A18368',
  low_orange = '#766551',
  high_red = '#DA7890',
  red = '#905A6F',
  low_red = '#69454F',
  high_purple = '#9D65AF',
  purple = '#826489',
  low_purple = '#5A4362',
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

  nc = '#0D0E0E',
  float = '#1A1D20',
  border = '#2E3939',
  selection = '#141D20',
  highlight = '#1A100E',
}

colors.error = colors.high_red
colors.warn = colors.high_orange
colors.info = colors.high_blue
colors.hint = colors.high_purple
colors.ok = colors.high_green

colors.match = colors.high_blue
colors.matchsub = colors.low_blue

colors.statusline = {
  fg = '#C5C5C5',
  fg2 = '#6B6B6B',
  bg = '#292929',
  bg2 = '#151515',
  cyan = colors.high_cyan,
  blue = colors.high_blue,
  green = colors.high_green,
  olive = colors.high_olive,
  orange = colors.high_orange,
  red = colors.high_red,
  purple = colors.high_purple,
}

return colors
