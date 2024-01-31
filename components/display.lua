-- components/display.lua

local Concord = require 'lib.concord'

return Concord.component('display', function(c, shape, w, h, r)
  c.shape = shape
  c.width = w
  c.height = h or 0
  c.radius = r or c.width * 2
end)
