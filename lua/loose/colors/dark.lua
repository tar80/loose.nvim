local colors = {
  none = "NONE",
  fg =          "#999999",
  bg =          "#000000",
  high_gray =   "#BDBDBD",
  gray =          "#7A7A7A",
  low_gray =        "#646464",
  high_blue =   "#8590C5",
  blue =          "#66759B",
  low_blue =        "#4E5B7A",
  high_cyan =   "#6AA5A6",
  cyan =          "#5F818B",
  low_cyan =        "#3C6874",
  high_green =  "#63A65E",
  green =         "#6A8466",
  low_green =       "#4C664C",
  high_olive =  "#BAAA6D",
  olive =         "#8B8261",
  low_olive =       "#6B6545",
  high_orange = "#CF8A60",
  orange =        "#A77762",
  low_orange =      "#7E5C46",
  high_red =    "#DD6481",
  red =           "#A66C75",
  low_red =         "#835159",
  high_purple = "#B95FE8",
  purple =        "#85688E",
  low_purple =      "#664E6D",

  diff_add =     "#3d6f84",
  diff_add_bg =    "#0a1921",
  diff_change =  "#567b56",
  diff_change_bg = "#101810",
  diff_remove =  "#69504d",
  diff_remove_bg = "#1d0b0b",
  diff_text =    "#79a96a",
  diff_text_bg =   "#142e14",

  nc =         "#0d0e0e",
  highlight =  "#241c17",
  float =      "#1a1d20",
  border =     "#2e3939",
  selection =  "#222735",
}

colors.error = colors.high_red
colors.warn = colors.high_olive
colors.info = colors.high_blue
colors.hint = colors.high_purple

colors.match = colors.high_red
colors.matchsub = colors.low_red

colors.feline = {
  fg = '#678D8A',
  fg1 = '#476D6A',
  bg = '#173334',
  bg2 = '#215053',
  cyan = '#67B0B5',
  blue = '#628EBB',
  green = '#79A269',
  olive = '#A89E67',
  orange = '#BB8970',
  red = '#C36A74',
  purple = '#A176B5',
}

return colors
