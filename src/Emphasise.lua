local GetLuminance = require(script.Parent.GetLuminance)
local Lighten = require(script.Parent.Lighten)
local Darken = require(script.Parent.Darken)

--[=[
	@function Emphasise
	@within ColourUtils

	:::tip

	Emphasise is also available under the `Emphasize` alias.

	:::

	@param colour Color3 -- The colour to emphasise.
	@param coefficient number -- The amount to emphasise by [0-1].
	@param threshold? number -- The threshold for light/dark [0-1] (defaults to 0.5).
	@return Color3 -- The emphasised colour.
]=]
return function(colour: Color3, coefficient: number, threshold: number?): Color3
	threshold = type(threshold) == "number" and threshold or 0.5
	return GetLuminance(colour) > threshold and Darken(colour, coefficient) or Lighten(colour, coefficient)
end
