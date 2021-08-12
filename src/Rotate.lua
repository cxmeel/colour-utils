local Assert = require(script.Parent._Util.Assert)
local assertTypeOf = Assert.prepTypeOf("Rotate")

return function(colour: Color3, angle: number): Color3
  assertTypeOf("colour", "Color3", colour)
  assertTypeOf("angle", "number", angle)

  local hue, sat, val = colour:ToHSV()
  local newHue = math.clamp((hue + (angle / 360)) % 1, 0, 1)

  local newColour = Color3.fromHSV(newHue, sat, val)

  return newColour
end
