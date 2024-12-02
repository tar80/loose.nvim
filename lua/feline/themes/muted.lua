local M = {}
M.theme = {
  blue = "#426da7",
  bg = "#ececec",
  fg = "#3e3e3e",
  orange = "#ce7550",
  green = "#678e45",
  fg2 = "#757e76",
  olive = "#b19a4d",
  purple = "#ab41b0",
  bg2 = "#c4c4c4",
  red = "#c1596a",
  cyan = "#5c9cb2",
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