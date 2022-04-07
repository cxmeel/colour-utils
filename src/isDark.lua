local Assert = require(script.Parent._Util.Assert)
local assertTypeOf = Assert.prepTypeOf("isDark")

local GetLuminance = require(script.Parent.GetLuminance)

--[=[
	@function isDark
	@within ColourUtils

	@param colour Color3 -- The colour to check.
	@return boolean -- Whether the colour is dark.
]=]
return function(colour: Color3): boolean
	assertTypeOf("colour", "Color3", colour)

	return GetLuminance(colour) < 0.5
end
