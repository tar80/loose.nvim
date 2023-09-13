local config = require("loose.config")
local core = require("loose.core")

local loose = {}

function loose.setup(options)
  config.set_options(options)
  loose.load(true)
end

function loose.load(exec_autocmd)
  local colors = require("loose.colors").load()
  core.load(colors, exec_autocmd)
end

function loose.colors(name)
   return require(require('loose.colors').color(name))
end

return loose
