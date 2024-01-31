-- components/position.lua
local Concord = require 'lib.concord'

return Concord.component('position', function(c, x, y)
  c.x = x or 0
  c.y = y or 0
end)
