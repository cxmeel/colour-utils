local GetLuminance = require(script.Parent.GetLuminance)

local max = math.max
local min = math.min

local fmt = string.format

local ERR_INVALID_TYPE = "getContrastRatio(...): The `%s` argument must be a Color3, but you passed %q (%s)"

return function(foreground: Color3, background: Color3): number
    assert(typeof(foreground) == "Color3", fmt(ERR_INVALID_TYPE, "foreground", tostring(foreground), typeof(foreground)))
    assert(typeof(background) == "Color3", fmt(ERR_INVALID_TYPE, "background", tostring(background), typeof(background)))

    local lumA = GetLuminance(foreground)
    local lumB = GetLuminance(background)

    return (max(lumA, lumB) + .05) / (min(lumA, lumB) + .05)
end
