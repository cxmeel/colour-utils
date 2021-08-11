local fmt = string.format

local ERR_INVALID_TYPE = "invert(...): The `%s` argument must be a %s, but you passed %q (%s)"

return function(colour: Color3): Color3
  assert(typeof(colour) == "Color3", fmt(ERR_INVALID_TYPE, "colour", "Color3", tostring(colour), typeof(colour)))

  return Color3.new(
    1 - colour.R,
    1 - colour.G,
    1 - colour.B
  )
end
