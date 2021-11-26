local Assert = require(script.Parent._Util.Assert)
local assertTypeOf = Assert.prepTypeOf("GetContrastingColour")

local GetContrastRatio = require(script.Parent.GetContrastRatio)
local Lighten = require(script.Parent.Lighten)
local Darken = require(script.Parent.Darken)
local isDark = require(script.Parent.isDark)

local MIN_RATIO = 4.5

return function(foreground: Color3, background: Color3, ratio: number?): Color3
	assertTypeOf("foreground", "Color3", foreground)
	assertTypeOf("background", "Color3", background)

	ratio = type(ratio) == "number" and ratio or MIN_RATIO

	local contrastRatio = GetContrastRatio(foreground, background)

	if contrastRatio >= ratio then
		return foreground
	end

	if isDark(background) then
		return Lighten(foreground, (ratio - contrastRatio) / ratio)
	end

	return Darken(foreground, (ratio - contrastRatio) / ratio)
end
