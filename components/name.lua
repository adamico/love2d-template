-- components/name.lua
local Concord = require 'lib.concord'

return Concord.component('name', function(s)
  c.string = s
end)
