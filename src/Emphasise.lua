local GetLuminance = require(script.Parent.GetLuminance)
local Lighten = require(script.Parent.Lighten)
local Darken = require(script.Parent.Darken)

return function(colour: Color3, coefficient: number, threshold: number?): Color3
    threshold = type(threshold) == "number" and threshold or .5
    return GetLuminance(colour) > threshold and Darken(colour, coefficient) or Lighten(colour, coefficient)
end
