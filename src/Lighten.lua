local Assert = require(script.Parent._Util.Assert)
local assertTypeOf = Assert.prepTypeOf("Lighten")

local clampColour = require(script.Parent._Util.ClampColour)

--[=[
	@function Lighten
	@within ColourUtils

	@param colour Color3 -- The colour to lighten.
	@param coefficient number -- The amount to lighten by [0-1].
	@return Color3 -- The lightened colour.
]=]
return function(colour: Color3, coefficient: number): Color3
	assertTypeOf("colour", "Color3", colour)
	assertTypeOf("coefficient", "number", coefficient)

	return clampColour(colour:Lerp(Color3.new(1, 1, 1), coefficient))
end
