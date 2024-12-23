local M = {}
M.theme = {
  purple = "#e136ea",
  bg2 = "#d0d0d0",
  red = "#f95874",
  olive = "#cfac2f",
  fg2 = "#859387",
  bg = "#f1f1f1",
  green = "#6fac33",
  fg = "#4f4f4f",
  orange = "#ff7b3c",
  blue = "#3b84df",
  cyan = "#52b7d8",
}
M.vi_mode = {
  NORMAL = M.theme.fg,
  INSERT = M.theme.cyan,
  REPLACE = M.theme.orange,
  OP = M.theme.red,
  VISUAL = M.theme.purple,
  LINES = M.theme.purple,
  BLOCK = M.theme.purple,
  ["V-REPLACE"] = M.theme.purple,
  ENTER = M.theme.cyan,
  MORE = M.theme.cyan,
  SELECT = M.theme.red,
  COMMAND = M.theme.green,
  SHELL = M.theme.green,
  TERM = M.theme.blue,
  NONE = M.theme.red,
}
return M