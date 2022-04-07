--[=[
	@class ColourUtils
]=]
local module = {
	-- Methods --
	Darken = require(script.Darken),
	Emphasise = require(script.Emphasise),
	GetContrastingColour = require(script.GetContrastingColour),
	GetContrastRatio = require(script.GetContrastRatio),
	GetLuminance = require(script.GetLuminance),
	GetPerceivedBrightness = require(script.GetPerceivedBrightness),
	Invert = require(script.Invert),
	isDark = require(script.isDark),
	isLight = require(script.isLight),
	Lighten = require(script.Lighten),
	Rotate = require(script.Rotate),

	-- Submodules --
	APCA = require(script.APCA),
	Blend = require(script.Blend),
	Blind = require(script.Blind),
	Hex = require(script.Hex),
	Int = require(script.Int),
	Palette = require(script.Palette),
	WCAG = require(script.WCAG),
}

module.Emphasize = module.Emphasise
module.GetContrastingColor = module.GetContrastingColour

return module
