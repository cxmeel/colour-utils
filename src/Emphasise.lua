local GetLuminance = require(script.Parent.GetLuminance)
local Lighten = require(script.Parent.Lighten)
local Darken = require(script.Parent.Darken)

return function(colour: Color3, coefficient: number): Color3
    return GetLuminance(colour) > .5 and Darken(colour, coefficient) or Lighten(colour, coefficient)
end
