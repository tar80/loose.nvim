local M = {}
M.theme = {
  blue = "#718aa2",
  bg = "#282828",
  fg = "#c4c4c4",
  orange = "#bba288",
  green = "#88ad95",
  fg2 = "#6a6a6a",
  cyan = "#87acac",
  red = "#bf8392",
  bg2 = "#14141a",
  olive = "#abab8d",
  purple = "#906d9b",
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