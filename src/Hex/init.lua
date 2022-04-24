local Assert = require(script.Parent._Util.Assert)
local ClampColour = require(script.Parent._Util.ClampColour)

local sub = string.sub
local gsub = string.gsub
local fmt = string.format
local rep = string.rep
local split = string.split

local HEX_EXCLUDE_PATTERN = "[^A-Fa-f0-9]"
local HEX_FORMAT_PATTERN = "%.2x%.2x%.2x"

--[=[
	@function fromHex
	@within Hex

	:::tip

	You can use hex values in any format. This includes with or without
	a leading hash, any case, and any length (`FromHex` will try to
	interpret malformed hex codes as best as possible).

	:::

	@param hex string -- The hex string to convert.
	@return Color3 -- The resulting Color3.
]=]
local function FromHex(hex: string): Color3
	Assert.typeOf("FromHex", "hex", "string", hex)

	hex = gsub(hex, HEX_EXCLUDE_PATTERN, "")

	if #hex == 3 then
		local characters = split(hex, "")
		local finalHex = ""

		for _, character in ipairs(characters) do
			finalHex ..= rep(character, 2)
		end

		hex = finalHex
	elseif #hex < 6 then
		hex = fmt("%s%s", hex, rep(hex, 6 - #hex))
	end

	local red = tonumber(sub(hex, 1, 2), 16)
	local green = tonumber(sub(hex, 3, 4), 16)
	local blue = tonumber(sub(hex, 5, 6), 16)

	return ClampColour(Color3.fromRGB(red, green, blue))
end

--[=[
	@function toHex
	@within Hex

	:::note

	The hex string is always lowercase, will always be 6 characters long, and
	is not prefixed with a hash.

	:::

	@param colour Color3 -- The colour to convert.
	@return string -- The hex representation of the colour.
]=]
local function ToHex(colour: Color3): string
	Assert.typeOf("ToHex", "colour", "Color3", colour)

	local red = colour.R * 255
	local green = colour.G * 255
	local blue = colour.B * 255

	local hex = fmt(HEX_FORMAT_PATTERN, red, green, blue)

	return hex
end

--[=[
	@class Hex
]=]
return {
	fromHex = FromHex,
	toHex = ToHex,
}
