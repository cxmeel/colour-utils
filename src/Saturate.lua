local Assert = require(script.Parent._Util.Assert)
local ClampColour = require(script.Parent._Util.ClampColour)

local assertTypeOf = Assert.prepTypeOf("Saturate")

local clamp = math.clamp

--[=[
  @function Saturate
  @within ColourUtils

  @param colour Color3 -- The colour to saturate.
  @param coefficient number -- The coefficient to saturate by [0-1].
  @return Color3 -- The saturated colour.
]=]
return function(colour: Color3, coefficient: number): Color3
	assertTypeOf("colour", "Color3", colour)
	assertTypeOf("coefficient", "number", coefficient)

	local H, S, V = colour:ToHSV()
	S += S * coefficient

	return ClampColour(Color3.fromHSV(H, clamp(S, 0, 1), V))
end
