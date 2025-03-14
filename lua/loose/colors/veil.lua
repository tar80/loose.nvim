local colors = {
  fg = '#d9d8e0',
  bg = '#4F4F4F',
  high_gray = '#f0eff4',
  gray = '#ABAEC2',
  low_gray = '#8C93AC',
  high_blue = '#66A4FF',
  blue = '#81AEF5',
  low_blue = '#6C82C3',
  high_cyan = '#80FBFF',
  cyan = '#8ED7F2',
  low_cyan = '#76A9BB',
  high_green = '#A0FFA5',
  green = '#99D79D',
  low_green = '#6DA37D',
  high_olive = '#DEE58F',
  olive = '#C3BF96',
  low_olive = '#9D9882',
  high_orange = '#FFBE7D',
  orange = '#E5BF92',
  low_orange = '#B29673',
  high_red = '#FF7ABD',
  red = '#F197B2',
  low_red = '#C46F90',
  high_purple = '#BF6FFF',
  purple = '#C18FE9',
  low_purple = '#9A6EBD',
  shade_gray = '#555366',
  shade_blue = '#515C7D',
  shade_cyan = '#4A656F',
  shade_green = '#44624E',
  shade_olive = '#605B47',
  shade_orange = '#6F5536',
  shade_red = '#744456',
  shade_purple = '#604378',

  diff_add = '#424471',
  diff_change = '#42574d',
  diff_remove = '#57354e',
  diff_text = '#9afeb2',
  diff_text_bg = '#4f866a',

  nc = '#35354e',
  float = '#424459',
  border = '#8b8bbc',
  selection = '#545671',
  highlight = '#4B284D',
}

colors.error = colors.high_red
colors.warn = colors.high_olive
colors.info = colors.high_blue
colors.hint = colors.high_purple
colors.ok = colors.high_green

colors.match = colors.high_blue
colors.matchsub = colors.low_blue

colors.statusline = {
  fg = '#3E3E3E',
  fg2 = '#757E76',
  bg = '#ECECEC',
  bg2 = '#C4C4C4',
  cyan = colors.high_cyan,
  blue = colors.high_blue,
  green = colors.high_green,
  olive = colors.high_olive,
  orange = colors.high_orange,
  red = colors.high_red,
  purple = colors.high_purple,
}

return colors
