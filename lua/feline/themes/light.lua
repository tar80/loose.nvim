local M = {}

M.theme = {
  fg = "#556358",
  fg2 = "#859387",
  bg = "#DCEBDE",
  bg2 = "#94BAA4",
  cyan = "#31A4A6",
  blue = "#3A6EC3",
  green = "#279A1A",
  olive = "#A39223",
  orange = "#D76400",
  red = "#C61D37",
  purple = "#9C3FC6",
}

M.vi_mode = {
  NORMAL = M.theme.fg,
  INSERT = M.theme.cyan,
  REPLACE = M.theme.orange,
  OP = M.theme.red,
  VISUAL = M.theme.purple,
  LINES = M.theme.purple,
  BLOCK = M.theme.purple,
  ['V-REPLACE'] = M.theme.purple,
  ENTER = M.theme.cyan,
  MORE = M.theme.cyan,
  SELECT = M.theme.red,
  COMMAND = M.theme.green,
  SHELL = M.theme.green,
  TERM = M.theme.blue,
  NONE = M.theme.red,
}

return M
