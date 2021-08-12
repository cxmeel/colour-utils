local Assert = require(script.Parent._Util.Assert)
local assertTypeOf = Assert.prepTypeOf("isDark")

local GetLuminance = require(script.Parent.GetLuminance)

return function(colour: Color3): boolean
  assertTypeOf("colour", "Color3", colour)

  return GetLuminance(colour) < .5
end
