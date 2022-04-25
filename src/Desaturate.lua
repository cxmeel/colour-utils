local Assert = require(script.Parent._Util.Assert)
local Saturate = require(script.Parent.Saturate)

local assertTypeOf = Assert.prepTypeOf("Saturate")

--[=[
  @function Desaturate
  @within ColourUtils

  @param colour Color3 -- The colour to desaturate.
  @param coefficient number -- The coefficient to desaturate by [0-1].
  @return Color3 -- The desaturated colour.
]=]
return function(colour: Color3, coefficient: number): Color3
	assertTypeOf("colour", "Color3", colour)
	assertTypeOf("coefficient", "number", coefficient)

	return Saturate(colour, -coefficient)
end
