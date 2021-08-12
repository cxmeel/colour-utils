local module = {
    -- Methods --
    Darken = require(script.Darken),
    Emphasise = require(script.Emphasise),
    GetContrastRatio = require(script.GetContrastRatio),
    GetLuminance = require(script.GetLuminance),
    Invert = require(script.Invert),
    isDark = require(script.isDark),
    isLight = require(script.isLight),
    Lighten = require(script.Lighten),
    Rotate = require(script.Rotate),

    -- Submodules --
    Blend = require(script.Blend),
    Hex = require(script.Hex),
    Int = require(script.Int),
}

module.Emphasize = module.Emphasise

return module
