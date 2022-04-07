local Assert = require(script.Parent.Parent._Util.Assert)
local assertTypeOf = Assert.prepTypeOf("GetContrastingColour")

local GetContrastRatio = require(script.Parent.GetContrastRatio)
local Lighten = require(script.Parent.Parent.Lighten)
local Darken = require(script.Parent.Parent.Darken)
local isDark = require(script.Parent.Parent.isDark)

local MIN_RATIO = 4.5

--[=[
	@function GetContrastingColour
	@within WCAG

	@param foreground Color3 -- The foreground colour.
	@param background Color3 -- The background colour.
	@param ratio? number -- The ratio to check against [0-1] (defaults to 4.5).
	@return Color3 -- The contrasting colour.
]=]
return function(foreground: Color3, background: Color3, ratio: number?): Color3
	assertTypeOf("foreground", "Color3", foreground)
	assertTypeOf("background", "Color3", background)

	ratio = if type(ratio) == "number" then ratio else MIN_RATIO

	local contrastRatio = GetContrastRatio(foreground, background)

	if contrastRatio >= ratio then
		return foreground
	end

	if isDark(background) then
		return Lighten(foreground, (ratio - contrastRatio) / ratio)
	end

	return Darken(foreground, (ratio - contrastRatio) / ratio)
end
