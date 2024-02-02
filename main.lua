-- main.lua

local vudu = require 'lib.vudu'

local input = require 'input'
local world = require 'world'
local physics_world = require 'physics_world'

local draw_system = require 'systems.draw_system'
local physics_system = require 'systems.physics_system'

local screenWidth, screenHeight, flags = love.window.getMode()

local playerPosition = { x = screenWidth / 2, y = screenHeight / 2 }

local player = require('entities.player')(playerPosition.x, playerPosition.y, 'kinematic', 'circle', 'line', { radius = 10 }, 300, 300)

function love.load()
  vudu.initialize()
  vudu.physics.setWorld(physics_world)
  world:addEntity(player)
  world:addSystems(physics_system, draw_system)
end

love.focus = function(focused)
  input.toggle_focus(focused)
end

love.keypressed = function(pressed_key)
  input.press(pressed_key)
end

love.keyreleased = function(released_key)
  input.release(released_key)
end

function love.draw()
  world:emit('draw')
end

function love.update(dt)
  if not input.paused then
    world:emit('update', dt)
    physics_world:update(dt)
  end
end