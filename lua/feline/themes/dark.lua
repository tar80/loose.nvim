local M = {}

M.theme = {
  fg = '#678D8A',
  fg1 = '#476D6A',
  bg = '#173334',
  bg2 = '#215053',
  cyan = '#67B0B5',
  blue = '#628EBB',
  green = '#7C9E7A',
  olive = '#A89E67',
  orange = '#BB8970',
  pink = '#C36A74',
  purple = '#A176B5',
}

M.vi_mode = {
  NORMAL = M.theme.fg,
  INSERT = M.theme.cyan,
  REPLACE = M.theme.orange,
  OP = M.theme.pink,
  VISUAL = M.theme.purple,
  LINES = M.theme.purple,
  BLOCK = M.theme.purple,
  ['V-REPLACE'] = M.theme.purple,
  ENTER = M.theme.cyan,
  MORE = M.theme.cyan,
  SELECT = M.theme.pink,
  COMMAND = M.theme.green,
  SHELL = M.theme.green,
  TERM = M.theme.blue,
  NONE = M.theme.pink,
}

return M
