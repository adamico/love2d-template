-- draw_system.lua
local Concord = require 'lib.concord'

local draw_system = Concord.system({
  pool = {'position', 'display'}
})

local drawRect = function(x, y, w, h)
  love.graphics.rectangle('line', x, y, w, h)
end

local drawCirc = function(x, y, r)
  love.graphics.circle('line', x, y, r)
end

local drawShape = function(e)
  local display = e.display
  local shape = display.shape
  local px, py = e.position.x, e.position.y
  
  if shape == 'circle' then drawCirc(px, py, display.radius) end
  if shape == 'rectangle' then drawRect(px, py, display.width, display.height) end
end

function draw_system:draw()
  for _, e in ipairs(self.pool) do
    drawShape(e)
  end
end

return draw_system
