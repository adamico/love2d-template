-- entities/player.lua

local Concord = require 'lib.concord'
local Entity = Concord.entity

local physics_world = require 'physics_world'
local input = require 'input'

local physics = love.physics

local shapesDict = {
  circle = {
    drawFunction = function (mode, positionX, positionY, dimensions)
      return love.graphics.circle(mode, positionX, positionY, dimensions.radius)
    end,
    physicsFunction = function (dimensions)
      return physics.newCircleShape(dimensions.radius)
    end
  },
  rectangle = {
    draw = function (mode, positionX, positionY, dimensions)
      return love.graphics.rectangle(mode, positionX, positionY, dimensions.width, dimensions.height)
    end,
    physics = function (dimensions)
      return physics.newRectangleShape(dimensions.width, dimensions.height)
    end
  }
}

return function (positionX, positionY, bodyType, shapeType, drawMode, dimensions, velocityXValue, velocityYValue)
  local entity = Entity()

  local body = physics.newBody(physics_world, positionX, positionY, bodyType)
  local shape = shapesDict[shapeType].physicsFunction(dimensions)
  local fixture = physics.newFixture(body, shape)
  fixture:setUserData(entity)

  local windowWidth, windowHeight = love.window.getMode()
  local leftBoundary = dimensions.radius + 2
  local rightBoundary = windowWidth - dimensions.radius - 2
  local topBoundary = dimensions.radius + 2
  local bottomBoundary = windowHeight - dimensions.radius - 2
  local velocity = {
    xValue = velocityXValue,
    yValue = velocityYValue,
    xDelta = 0,
    yDelta = 0
  }

  function entity:draw()
    local bodyCenterX, bodyCenterY = body:getWorldCenter()
    shapesDict[shapeType].drawFunction(drawMode, bodyCenterX, bodyCenterY, dimensions)
  end

  function entity:update()
    local bodyX, bodyY = body:getPosition()

    if input.left and input.right then
      velocity.xDelta = 0
      return
    end

    if input.up and input.down then
      velocity.yDelta = 0
      return
    end

    if input.left and bodyX > leftBoundary then
      velocity.xDelta = -1
    elseif input.right and bodyX < rightBoundary then
      velocity.xDelta = 1
    else
      velocity.xDelta = 0
    end

    if input.up and bodyY > topBoundary then
      velocity.yDelta = -1
    elseif input.down and bodyY < bottomBoundary then
      velocity.yDelta = 1
    else
      velocity.yDelta = 0
    end

    body:setLinearVelocity(velocity.xValue * velocity.xDelta , velocity.yValue * velocity.yDelta )
  end

  entity
  :give('physics', body, shape, fixture)
  :give('drawable')

  return entity
end