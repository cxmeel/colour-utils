local module = {
    Darken = require(script.Darken),
    Emphasise = require(script.Emphasise),
    GetContrastRatio = require(script.GetContrastRatio),
    GetLuminance = require(script.GetLuminance),
    Hex = require(script.Hex),
    Int = require(script.Int),
    Lighten = require(script.Lighten),
    Invert = require(script.Invert),
    isDark = require(script.isDark),
    isLight = require(script.isLight),
}

module.Emphasize = module.Emphasise

return module
