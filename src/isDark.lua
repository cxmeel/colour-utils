local GetLuminance = require(script.Parent.GetLuminance)

local fmt = string.format

local ERR_INVALID_TYPE = "isDark(...): The `%s` argument must be a %s, but you passed %q (%s)"

return function(colour: Color3): boolean
  assert(typeof(colour) == "Color3", fmt(ERR_INVALID_TYPE, "colour", "Color3", tostring(colour), typeof(colour)))

  return GetLuminance(colour) < .5
end
