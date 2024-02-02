-- systems/physics_system.lua

local Concord = require 'lib.concord'
local components = require 'components'

local physicsSystem = Concord.system({
  pool = { 'physics' }
})

function physicsSystem:update(dt)
  for _, entity in ipairs(self.pool) do
    entity:update(dt)
  end
end

return physicsSystem