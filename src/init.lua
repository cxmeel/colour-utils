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
	Blend = require(script.Blend),
	Hex = require(script.Hex),
	Int = require(script.Int),
	Palette = require(script.Palette),
}

module.Emphasize = module.Emphasise
module.GetContrastingColor = module.GetContrastingColour

return module
