-- main.lua

local world = require 'world'
local components = require 'components'
local draw_system = require 'systems.draw_system'
local player = require 'entities.player'

function love.load()
  world:addEntity(player)
  world:addSystems(draw_system)
end

function love.update(dt)
  world:emit('update', dt)  
end

function love.draw()
  world:emit('draw')
end
