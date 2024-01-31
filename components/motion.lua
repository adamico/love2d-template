-- components/motion.lua
local Concord = require 'lib.concord'

return Concord.component('motion', function(vx, vy, dx, dy)
  c.velocity = { x = vx, y = vy }
  c.dx = dx or 0
  c.dy = dy or 0
end)
