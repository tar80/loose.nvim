local M = {}
M.theme = {
  purple = "#9d65af",
  bg2 = "#151515",
  green = "#7ab690",
  blue = "#658db6",
  fg2 = "#6b6b6b",
  bg = "#292929",
  olive = "#adae7d",
  fg = "#c5c5c5",
  orange = "#c9a175",
  red = "#da7890",
  cyan = "#77b4b3",
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