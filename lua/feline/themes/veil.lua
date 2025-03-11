local M = {}
M.theme = {
  orange = "#ffbe7d",
  blue = "#66a4ff",
  green = "#a0ffa5",
  bg2 = "#c4c4c4",
  olive = "#dee58f",
  fg2 = "#757e76",
  bg = "#ececec",
  purple = "#bf6fff",
  fg = "#3e3e3e",
  red = "#ff7abd",
  cyan = "#80fbff",
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