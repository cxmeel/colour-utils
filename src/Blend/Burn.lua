local PrepFilter = require(script.Parent._Filter)

local lshift = bit32.lshift
local clamp = math.clamp
local max = math.max

return PrepFilter("Burn", function(background: number, foreground: number): number
  local bg = clamp(background * 255, 0, 255)
  local fg = foreground * 255

  return (bg == 0) and bg or max(0, (255 - lshift((255 - fg), 8) / bg))
end)
