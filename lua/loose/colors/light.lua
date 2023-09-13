local colors = {
  none = "NONE",

  fg =          "#4F4F4F",
  bg =          "#FFFFFF",
  high_gray =   "#1E1E1E",
  gray =          "#8A8A8A",
  low_gray =        "#A7A7A7",
  high_blue =   "#3D71FF",
  blue =          "#5B60AE",
  low_blue =        "#92A2D3",
  high_cyan =   "#31B0D0",
  cyan =          "#29889D",
  low_cyan =        "#6DB8C0",
  high_green =  "#36D328",
  green =         "#3C8C3C",
  low_green =       "#7EB67E",
  high_olive =  "#D3C809",
  olive =         "#8E8536",
  low_olive =       "#BAAE70",
  high_orange = "#F98312",
  orange =        "#D16C24",
  low_orange =      "#E89B64",
  high_red =    "#FE5F74",
  red =           "#C94859",
  low_red =         "#E7949C",
  high_purple = "#C926FF",
  purple =        "#944CA3",
  low_purple =      "#BC87BE",

  diff_add =     "#6A7F97",
  diff_add_bg =    "#D9EEF5",
  diff_change =   "#7AA07D",
  diff_change_bg =   "#E2FFE8",
  diff_remove =  "#BA8185",
  diff_remove_bg = "#FAE1E2",
  diff_text =  "#5B976E",
  diff_text_bg = "#BBF0CC",

  nc =         "#F4F4F4",
  highlight =  "#FEF5B2",
  float =      "#F1F4E7",
  border =     "#C8C8C8",
  selection =  "#CFD3D5",
}

colors.error = colors.high_red
colors.warn = colors.high_olive
colors.info = colors.high_blue
colors.hint = colors.high_purple

colors.match = colors.high_red
colors.matchsub = colors.low_red

colors.feline = {
  fg = "#556358",
  fg2 = "#859387",
  bg = "#DCEBDE",
  bg2 = "#94BAA4",
  cyan = "#31A4A6",
  blue = "#3A6EC3",
  green = "#279A1A",
  olive = "#A39223",
  orange = "#D76400",
  pink = "#C61D37",
  purple = "#9C3FC6",
}

return colors
