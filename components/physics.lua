-- components/physics.lua
local Concord = require 'lib.concord'

return Concord.component('physics', function(c, t, f)
  c.type = t or 'dynamic'
  c.friction = f or 1
end)
