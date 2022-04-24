local Assert = require(script.Parent._Util.Assert)
local ClampColour = require(script.Parent._Util.ClampColour)

local floor = math.floor
local rshift = bit32.rshift
local lshift = bit32.lshift
local band = bit32.band

--[=[
	@function fromInt
	@within Int

	@param int number -- The integer to convert.
	@return Color3 -- The resulting Color3.
]=]
local function FromInt(int: number): Color3
	Assert.typeOf("FromInt", "int", "number", int)
	int = floor(int)

	local red = band(rshift(int, 16), 255)
	local green = band(rshift(int, 8), 255)
	local blue = band(int, 255)

	return ClampColour(Color3.fromRGB(red, green, blue))
end

--[=[
	@function toInt
	@within Int

	@param colour Color3 -- The colour to convert.
	@return number -- The integer representation of the colour.
]=]
local function ToInt(colour: Color3): number
	Assert.typeOf("ToInt", "colour", "Color3", colour)

	local int = floor(colour.R * 255)
	int = lshift(int, 8) + floor(colour.G * 255)
	int = lshift(int, 8) + floor(colour.B * 255)

	return int
end

--[=[
	@class Int
]=]
return {
	fromInt = FromInt,
	toInt = ToInt,
}
