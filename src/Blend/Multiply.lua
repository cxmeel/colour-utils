local PrepFilter = require(script.Parent._Filter)

--[=[
	@function Multiply
	@within Blend

	@param background Color3 -- The background colour.
	@param foreground Color3 -- The foreground colour.
	@return Color3 -- The resulting colour.
]=]
return PrepFilter("Multiply", function(background: number, foreground: number): number
	return ((foreground * 255) * (background * 255)) / 255
end)
