--[=[
  @function Transparency
  @within Blend

  @param background Color3 -- The background colour.
  @param foreground Color3 -- The foreground colour.
  @param transparency number -- The transparency value.
  @return Color3 -- The resulting colour.
]=]
local function applyTransparency(background: Color3, foreground: Color3, transparency: number): Color3
	local alpha = 1 - transparency

	local red = foreground.R * alpha + background.R * transparency
	local green = foreground.G * alpha + background.G * transparency
	local blue = foreground.B * alpha + background.B * transparency

	return Color3.new(red, green, blue)
end

return applyTransparency
