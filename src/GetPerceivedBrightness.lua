local Assert = require(script.Parent._Util.Assert)

local assertTypeOf = Assert.prepTypeOf("GetPerceivedBrightness")

--[=[
	@function GetPerceivedBrightness
	@within ColourUtils

	@param colour Color3 -- The colour to get the perceived brightness of.
	@return number -- The perceived brightness of the colour [0-1].
]=]
return function(colour: Color3): number
	assertTypeOf("colour", "Color3", colour)

	local red = colour.R * 255
	local green = colour.G * 255
	local blue = colour.B * 255

	local bright = ((red * 299 + green * 587 + blue * 114) / 1000) / 255

	return bright
end
