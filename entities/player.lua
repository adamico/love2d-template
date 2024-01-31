-- entities/player.lua

local Concord = require 'lib.concord'
local Entity = Concord.entity

local player = Entity()

player
  :give('name', 'player')
  :give('position', 50, 50)
  :give('display', 'circle', 10)
  :give('physics', 'kinematic')
  :give('motion', 100, 100)

return player
