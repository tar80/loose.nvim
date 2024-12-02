local colors = {
  fg = '#434343',
  bg = '#FFFFFF',
  high_gray = '#222222',
  gray = '#686868',
  low_gray = '#9E9E9E',
  high_blue = '#426DA7',
  blue = '#3E5169',
  low_blue = '#7481A3',
  high_cyan = '#5C9CB2',
  cyan = '#49706E',
  low_cyan = '#739BA1',
  high_green = '#678E45',
  green = '#577048',
  low_green = '#728A65',
  high_olive = '#B19A4D',
  olive = '#807952',
  low_olive = '#A09870',
  high_orange = '#CE7550',
  orange = '#A86841',
  low_orange = '#B8866C',
  high_red = '#C1596A',
  red = '#995B64',
  low_red = '#AF767C',
  high_purple = '#AB41B0',
  purple = '#765672',
  low_purple = '#947197',
  shade_gray = '#F5F5F5',
  shade_blue = '#EBF5F9',
  shade_cyan = '#E5FEFD',
  shade_green = '#E6FECD',
  shade_olive = '#FBFEBD',
  shade_orange = '#FEF0DD',
  shade_red = '#FEECEE',
  shade_purple = '#FBE3FE',

  diff_add = '#5D6B79',
  diff_change = '#708871',
  diff_remove = '#9A7577',
  diff_text = '#567B62',
  diff_text_bg = '#C7EFa2',

  nc = '#F4F4F8',
  highlight = '#F8EDD7',
  float = '#ECF0E5',
  border = '#BBBBBB',
  selection = '#D0D3D5',
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
