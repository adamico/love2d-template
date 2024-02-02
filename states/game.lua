-- states/game.lua

local manager = StateManager

local game = {}

local pause = require 'states.pause'

local world = require 'world'
local physics_world = require 'physics_world'
local input = require 'input'

local screenWidth, screenHeight, flags = love.window.getMode()
local playerPosition = { x = screenWidth / 2, y = screenHeight / 2 }
local player = require('entities.player')(playerPosition.x, playerPosition.y, 'kinematic', 'circle', 'line', { radius = 30 }, 300, 300)

local draw_system = require 'systems.draw_system'
local physics_system = require 'systems.physics_system'

love.focus = function(focused)
  input.toggle_focus(focused)
end

function game:pause(...)
	print('pause', ...)
end

function game:resume(...)
	print('resume', ...)
end

function game:enter(previous, ...)
  world:addEntity(player)
  world:addSystems(physics_system, draw_system)
end

function game:update(dt)
  if input.paused then manager:push(pause) end
  world:emit('update', dt)
  physics_world:update(dt)
end

function game:draw()
  world:emit('draw')
end

return game