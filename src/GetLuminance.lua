local Assert = require(script.Parent._Util.Assert)

local assertTypeOf = Assert.prepTypeOf("GetLuminance")

local function transformValue(value: number): number
	return value <= 0.03928 and value / 12.92 or ((value + 0.055) / 1.055) ^ 2.4
end

--[=[
	@function GetLuminance
	@within ColourUtils

	@param colour Color3 -- The colour to get the luminance of.
	@return number -- The luminance of the colour [0-1].
]=]
return function(colour: Color3): number
	assertTypeOf("colour", "Color3", colour)

	local red = transformValue(colour.R)
	local green = transformValue(colour.G)
	local blue = transformValue(colour.B)

	local lum = 0.2126 * red + 0.7152 * green + 0.0722 * blue

	return lum
end
