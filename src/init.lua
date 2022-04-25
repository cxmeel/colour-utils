--[=[
	@class ColourUtils
]=]
local module = {
	-- Methods --
	Darken = require(script.Darken),
	Desaturate = require(script.Desaturate),
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
	Saturate = require(script.Saturate),

	-- Submodules --
	APCA = require(script.APCA),
	Blend = require(script.Blend),
	Blind = require(script.Blind),
	Hex = require(script.Hex),
	HSL = require(script.HSL),
	Int = require(script.Int),
	LAB = require(script.LAB),
	LCH = require(script.LCH),
	Palette = require(script.Palette),
	WCAG = require(script.WCAG),
}

module.Emphasize = module.Emphasise
module.GetContrastingColor = module.GetContrastingColour

return module
