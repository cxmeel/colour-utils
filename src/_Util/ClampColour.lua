local clamp = math.clamp

return function(colour: Color3): Color3
	local red = clamp(colour.R, 0, 1)
	local green = clamp(colour.G, 0, 1)
	local blue = clamp(colour.B, 0, 1)

	return Color3.new(red, green, blue)
end
