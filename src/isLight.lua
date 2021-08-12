local Assert = require(script.Parent._Util.Assert)
local assertTypeOf = Assert.prepTypeOf("isLight")

local isDark = require(script.Parent.isDark)

return function(colour: Color3): boolean
  assertTypeOf("colour", "Color3", colour)

  return not isDark(colour)
end
