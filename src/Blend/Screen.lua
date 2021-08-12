local PrepFilter = require(script.Parent._Filter)
local rshift = bit32.rshift

return PrepFilter("Screen", function(background: number, foreground: number): number
  return 255 - rshift(((255 - (foreground * 255)) * (255 - (background * 255))), 8)
end)
