local Assert = require(script.Parent._Util.Assert)
local clampColour = require(script.Parent._Util.ClampColour)

local assertTypeOf = Assert.prepTypeOf("Rotate")
local clamp = math.clamp

return function(colour: Color3, angle: number): Color3
  assertTypeOf("colour", "Color3", colour)
  assertTypeOf("angle", "number", angle)

  local hue, sat, val = colour:ToHSV()
  local newHue = clamp((hue + (angle / 360)) % 1, 0, 1)

  local newColour = Color3.fromHSV(newHue, sat, val)

  return clampColour(newColour)
end
