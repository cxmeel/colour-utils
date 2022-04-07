local ClampColour = require(script.Parent._Util.ClampColour)
local Assert = require(script.Parent._Util.Assert)
local assertTypeOf = Assert.prepTypeOf("Invert")

--[=[
	@function Invert
	@within ColourUtils

	@param colour Color3 -- The colour to invert.
	@return Color3 -- The inverted colour.
]=]
return function(colour: Color3): Color3
	assertTypeOf("colour", "Color3", colour)

	local inverse = Color3.new(1 - colour.R, 1 - colour.G, 1 - colour.B)

	return ClampColour(inverse)
end
