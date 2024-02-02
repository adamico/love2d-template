-- components/physics.lua

local Concord = require 'lib.concord'

return Concord.component('physics', function(component, bodyType, fixtureFriction)
  component.type = bodyType or 'dynamic'
  component.friction = fixtureFriction or 1
end)